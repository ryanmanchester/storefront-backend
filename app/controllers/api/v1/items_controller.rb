class Api::V1::ItemsController < ApplicationController
  before_action :set_item, only: [:update, :destroy]

  def index
    category = Category.find_by(id: params[:category_id])
    items = category.items
    render json: ItemSerializer.new(items)
  end

  def create
    item = current_seller.items.build(item_params)
    if item.save
      render json: item
    else
      render json: item.errors.full_messages.to_sentence
    end
  end

  def show
    render json: @item
  end

  def update
    if @item.update(item_params)
      render json: @item
    else
      render json: @item.errors.full_messages.to_sentence
    end
  end

  def destroy

  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :category_id, :description, :size, :price, :image_url, :sold)
  end

end
