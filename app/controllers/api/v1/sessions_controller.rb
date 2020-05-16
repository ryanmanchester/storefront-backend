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
end
