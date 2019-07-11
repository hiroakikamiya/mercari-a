class ItemsController < ApplicationController
    before_action :parents_set, only: [:new, :edit]
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
  end

  def create
    if Item.create(item_params)
    else
      redirect_to root_path
    end
  end

  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  def get_grandchild_ids
    @category_grandchild_ids = Category.find("#{params[:grandchild_id]}")
  end

  def edit
    @item = Item.find(params[:id])
    @parents = @item.category.root.name
  end

  def update
    binding.pry
    if Item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:name, :explain, :status_id, :delivery_cost_id, :delivery_way_id, :delivery_date_id, :price, :category_id, :prefecture_id)
  end

  def parents_set
    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  end
end
