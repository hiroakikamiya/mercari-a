class ItemsController < ApplicationController

  def index
    @items = Item.all.order("created_at DESC")
    # @items_ladies = Item.where(category: 7..61).order("id ASC")
    # @items_mens = Item.where(category: 75..108).order("id ASC")
    # @items_parent = Category.where(ancestry: nil)
    # @items_children = @items_parent.each do |parent|
    #   Category.where{ancestry: inculude?(parent.id)} ここ２行はビューで定義、renderは1つずつに変更
    # end
  end

  def new
    @item = Item.new
    @item.images.build
    @parents = Category.where(ancestry: nil)
    respond_to do |format|
      format.html
      format.json do
       @children = Category.find(params[:parent_id]).children
      end
    end
  end

  def create
    Item.create
  end

  def search
    respond_to do |format|
      format.html
      format.json do
        @grandchild = Category.find(params[:child_id]).children
      end
    end
  end

  def show
  end


  def edit
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    # params.require(:item).permit(:name,:explain,:category,:price,:prefecture,:delivery_type,:delivery_date)
  end
end
