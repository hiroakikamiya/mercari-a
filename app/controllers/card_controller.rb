class CardController < ApplicationController
  
  require "payjp"
  before_action :move_to_sign_in

  def new
    redirect_to action: "show" if Card.exists?(user_id: current_user.id)
  end

  def pay 
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      description: '登録テスト', 
      email: current_user.email, 
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      ) 
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        render 'pay'
      else
        redirect_to action: 'pay'
      end
    end
  end

  def delete 
    card = Card.where(user_id: current_user.id)
    if card.blank?
      redirect_to new_card_path
    else
      card = card[0]
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to action: "new"
  end

  def show 
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  private

  def move_to_sign_in
    redirect_to new_user_session_path unless user_signed_in?
  end

end

