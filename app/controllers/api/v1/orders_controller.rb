class Api::V1::OrdersController < ApplicationController


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

end
