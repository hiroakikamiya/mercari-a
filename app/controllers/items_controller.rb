class ItemsController < ApplicationController

  def index
    @items = Item.all.order("created_at DESC")
  end

  def show
  end

  def new
    @item = Item.new
    @parents = Category.where(ancestry: nil)
    respond_to do |format|
      format.html
      format.json do
       @children = Category.find(params[:parent_id]).children
      end
    end
  end

  def create
    Item.create(item_params)
  end

  def edit
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:name,:explain)
  end
end
