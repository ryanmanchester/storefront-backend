class Api::CategoriesController < ApplicationController
  before_action :find_category, only: [:show, :destroy]

  def index
    categories = Category.all
    render json: categories
  end

  def create
    category = Category.find_by(name: params[:name])
    if category
      render json: category
    else
      category = Category.new(category_params)
      if category.save
        render json: category
      else
        render json: {error: "Error in creating category"}
      end
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
