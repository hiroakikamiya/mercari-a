class UsersController < ApplicationController

  def index
    @nickname = current_user.nickname
  end

  def show
    @user = current_user.id
    @items = Item.where(seller_id: current_user.id)
  end

  def edit
    @item = Item.find(params[:id])
  end

  def logout
    user = current_user.id
  end

end
