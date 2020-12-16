class Api::V1::OrdersController < ApplicationController


private

def order_params
  params.require(:order).permit(:id)
end
