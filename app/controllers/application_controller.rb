class ApplicationController < ActionController::API
  include ::ActionController::Cookies

  def current_seller
    Seller.find_by(id: session[:seller_id])
  end

  def logged_in?
    !!current_seller
  end

  def clear_cart
    session.clear
    render json: {
      message: "Cart Cleared"
    }
  end
  
end
