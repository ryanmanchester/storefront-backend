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

end
