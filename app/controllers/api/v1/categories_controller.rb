class Api::V1::CategoriesController < ApplicationController
  before_action :find_category, only: [:show, :destroy]

  def index
    categories = Category.all
    render json: CategorySerializer.new(categories)
  end

  def create
    category = Category.find_or_initialize_by(name: params[:name])
    if category.save
      render json: category
    else
      render json: category.errors.full_messages
    end
  end

  def show
    render json: @category
  end

  private
  def find_category
    @category = Category.find_by(id: params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
