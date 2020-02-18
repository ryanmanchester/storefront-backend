class Api::ItemsController < ApplicationController
  before_action :find_item, only: [:show, :update, :destroy]

  def index
    items = Item.all
    render json: items
  end

  def create
    item = Item.new(item_params)
    if item.save
      render json: item
    else
      render json: {error: "Please make sure all fields are filled"}
    end
  end

  def show
    render json: @item
  end

  def update
  end

  def destroy
    @item.destroy
  end

  private
  def find_item
    @item = Item.find_by(id: params[:id])
  end
  
  def item_params
    params.require(:item).permit(:name, :category_id, :description, :size, :price, :image_url, :sold)
  end

end
