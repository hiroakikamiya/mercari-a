class ItemsController < ApplicationController

  def index
    
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

  def search
    respond_to do |format|
      format.html
      format.json do
        @grandchild = Category.find(params[:child_id]).children
      end
    end
  end

  def create
    Item.create(item_params)
  end

  def edit
  end

  private

  def item_params
    params.require(:item).permit(:name,:explain)
  end
end
