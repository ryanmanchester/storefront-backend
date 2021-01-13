class Api::V1::CartsController < ApplicationController
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
end

def remove_item
  cart = session[:cart]
  byebug
  item_remove = cart.find {|item| item[:id] == params[:id]}
  if cart.delete(item_remove)
    render json: {
      message: "Item removed from cart"
    }
  else
    render json: {
      error: "Error in removing item from cart"
    }
  end
end
