class ApplicationController < ActionController::API
  include ::ActionController::Cookies

  def current_seller
    Seller.find_by(id: session[:seller_id])
  end

  def logged_in?
    !!current_seller
  end
end
