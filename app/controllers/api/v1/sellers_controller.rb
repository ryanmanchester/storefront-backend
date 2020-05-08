class Api::V1::SellersController < ApplicationController

  def create
    seller = Seller.find_or_initialize_by(name: seller_params[:name])
    if seller.save
      render json: seller
    else
      render json: seller.errors.full_messages
    end
  end

  def show
    seller = Seller.find(params[:id])
    render json: seller
  end

  def destroy
  end

  private

  def seller_params
    params.require(:seller).permit(:name, :password, :image_url)
  end

end
