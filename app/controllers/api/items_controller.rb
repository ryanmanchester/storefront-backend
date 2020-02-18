class Api::ItemsController < ApplicationController
  before_action :set_category

  def index
    items = @category.items
    render json: items
  end

  def create
    item = @category.items.build(item_params)
    if item.save
      render json: item
    else
      render json: {error: "Please make sure all fields are filled"}
    end
  end

  def show
    item = @category.items.find_by(id: params[:id])
    render json: item
  end

  def update
    @category.items.update(item_params)
  end

  def destroy
    @category.items.destroy
  end

  private

  def set_category
    @category = Category.find_by(id: params[:category_id])
  end

  def item_params
    params.require(:item).permit(:name, :category_id, :description, :size, :price, :image_url, :sold)
  end

end
