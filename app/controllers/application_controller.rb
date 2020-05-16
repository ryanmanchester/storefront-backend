class ApplicationController < ActionController::API
  def current_seller
    User.find(session[:seller_id])
  end

  def logged_in?
    !!current_seller
  end
end
