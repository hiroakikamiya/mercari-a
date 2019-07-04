class Users::RegistrationsController < ApplicationController

  def index
  end
  
  def step1
    @user = User.new
  end

  def step2
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:name_kanji] = user_params[:name_kanji]
    session[:name_kana] = user_params[:name_kana]
    session[:birthday] = Date.new(user_params["birthday(1i)"]&.to_i, user_params["birthday(2i)"]&.to_i, user_params["birthday(3i)"]&.to_i)

    @user = User.new
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
      phone_number: user_params[:phone_number]
    )
    if @user.save
    else
      redirect_to step1_users_registrations_path
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation ,:nickname, :name_kanji, :name_kana, :birthday, :phone_number)
  end
end
