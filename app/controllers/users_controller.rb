class UsersController < ApplicationController

  def index
    users = current_user.id
    @nickname = current_user.nickname
  end

  def show
    @items = Item.where(seller_id: current_user.id)
  end

  def edit
    @item = Item.find(params[:id])
  end

  def logout
    user = current_user.id
  end

end
