class Api::V1::SessionsController < ApplicationController
  def create
    seller = Seller.find_by(name: params[:session][:name])
    if seller && seller.authenticate(params[:session][:password])
      session[:seller_id] = seller.id
      render json: seller
    else
      render json: {
        error: "Seller Not Found"
      }
    end
  end

  def get_current_seller
    if logged_in?
      render json: current_seller
    else
      render json: {
        error: "Please Log In"
      }
    end
  end

  def destroy
    session.clear
    render json: {
      notice: "You are now logged out"
    }
  end
end
