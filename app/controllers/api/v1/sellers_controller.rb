class Api::V1::SellersController < ApplicationController

  def create
    seller = Seller.new(seller_params)
    if seller.save
      options = {
        include: [:items]
      }
      render json: SellerSerializer.new(seller, options)
    else
      render json: {
        error: seller.errors.full_messages
      }
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
