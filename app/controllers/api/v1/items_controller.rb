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

      render json: ItemSerializer.new([item])
    else
      render json: {
        error: item.errors.full_messages.to_sentence
      }
    end
  end


  def update
    if @item.update(item_params)
      render json: ItemSerializer.new([@item])
    else
      render json: {
        error: @item.errors.full_messages.to_sentence
        }
    end
  end

  def destroy
    @item.destroy
    render json: {
      message: "Item successfully deleted"
    }
  end

  def add_to_cart
    session[:cart] ||= []
    session[:cart] << params
    render json: params
  end

  def current_cart
    !!session[:cart]
  end

  def get_current_cart
    if current_cart
      render json: session[:cart]
    else
      render json: {
        error: "Cart Not Found"
      }
    end
  end

  def clear_cart
    session.clear
    render json: {
      message: "Cart Cleared"
    }
  end

  def place_order
    cart = session[:cart]
    order = cart.map {|item| Item.find(item[:id])}
    if order.each {|item| item.destroy}
      clear_cart
    else
      render json: {
        message: "An error has occured with your order. Please try again."
      }
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :category_id, :description, :size, :price, :image_url, :sold)
  end

end
