# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  def index
  end

  def new
  end

  def basic
    @user = User.new
  end
    
  def phone_number
    if verify_recaptcha
      session[:nickname] = user_params[:nickname]
      session[:email] = user_params[:email]
      session[:password] = user_params[:password]
      session[:password_confirmation] = user_params[:password_confirmation]
      session[:name_kanji] = user_params[:name_kanji]
      session[:name_kana] = user_params[:name_kana]
      session[:birthday] = user_params["birthday(1i)"] + "-" +  user_params["birthday(2i)"] + "-" + user_params["birthday(3i)"]
    else
      self.resource = resource_class.new
      respond_with_navigational(resource) { render :basic }
    end
    @user = User.new
  end

  def address
    session[:phone_number] = user_params[:phone_number]

    @user = User.new
    @user.build_residence
  end

  def card
  end

  def create
    @user = User.new(
      nickname: session[:nickname], 
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      name_kanji: session[:name_kanji],
      name_kana: session[:name_kana],
      birthday: session[:birthday],
      phone_number: session[:phone_number]
    )
    @user.build_residence(user_params[:residences])
    if @user.save
      sign_in(@user)
      redirect_to root_path
    else
      redirect_to user_basic_path
    end
  end
  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation ,:nickname, :name_kanji, :name_kana, :birthday, :phone_number, residences: [:post_code, :prefecture_id, :city, :address, :detail])
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
