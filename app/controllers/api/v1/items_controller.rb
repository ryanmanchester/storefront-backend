class Api::V1::ItemsController < ApplicationController
  before_action :set_category

  def index
    items = @category.items
    render json: ItemSerializer.new(items)
  end

  def create
    #byebug
    item = current_seller.items.build(item_params)
    if item.save
      render json: ItemSerializer.new(item)
    else
      render json: item.errors.full_messages.to_sentence
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
