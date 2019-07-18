class ItemsController < ApplicationController
    before_action :parents_set, only: [:new]
    before_action :move_to_sign_in, except: [:show, :index]
    before_action :seller_set, only: [:new, :edit]
    before_action :set_item, only: [:show, :edit, :update, :destroy,:pay,:payed]
  def index
    @parents = Category.where(ancestry: nil)
  end

  def new
    @item = Item.new
    10.times{@item.images.build}
  end 

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def edit
  end

  def show
  end

  def edit_category_children
    @edit_children = Category.find(params[:parent_id]).children
  end

  def edit_category_grandchildren
    @edit_grandchildren = Category.find(params[:child_id]).children
  end

  def edit_category_grandchild_id
    @edit_grandchildren_id = Category.find(params[:grandchild_id])
  end

  def get_category_children
    @category_children = Category.find_by(name: params[:parent_name], ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find(params[:child_id]).children
  end

  def get_grandchild_ids
    @category_grandchild_ids = Category.find(params[:grandchild_id])
  end

  def buy
    @item = Item.find(params[:id]) 
    @buyed_item = Item.find(params[:id])
    @buyer_id = current_user.id
    card = Card.where(user_id: current_user.id).first

    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    customer = Payjp::Customer.retrieve(card.customer_id)
    @default_card_information = customer.cards.retrieve(card.card_id)
  end

  def pay
    @buyed_item = Item.find(params[:id])
    @buyer_id = current_user.id
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    if Payjp::Charge.create(
    :amount => @item.price, 
    :customer => card.customer_id, 
    :currency => 'jpy', 
  ) 
    else
      redirect_to root_path
    end
  redirect_to payed_items_path
  end

  def payed
    @buyed_item = Item.find(params[:id])
    @buyed_item.update(buyer_id: current_user.id)
    card = Card.where(user_id: current_user.id).first
  end

  def buy_update
    @buyer_id = current_user.id
    @buyed_item = Item.find(params[:id])
    @buyed_item.update(buyer_id: current_user.id)
    redirect_to root_path
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    @another_items = Item.where(seller_id: @item.seller_id).where.not(id: @item.id)
  end

  def destroy
    if @item.seller_id == current_user.id
      @item.destroy
    end
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :explain, :status_id, :delivery_cost_id, :delivery_way_id, :delivery_date_id, :price, :category_id, :prefecture_id, :seller_id, images_attributes:[:image])
  end
  def seller_set
    @seller = current_user.id
  end

  def parents_set
    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  end
  def set_item
    @item = Item.find(params[:id])
  end
  def move_to_sign_in
    redirect_to new_user_session_path unless user_signed_in?
  end
end