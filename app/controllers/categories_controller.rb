class CategoriesController < ApplicationController
  # before_action :set_category, only: [:show, :edit, :update, :destroy ]

  # def index
  #   @categories = Category.paginate(page: params[:page], per_page: 5)
  # end

  # def show
  # end

  # def new
  #   @category = Category.new
  # end

  # def edit
  # end

  # def create
  #   @category = Category.new(category_params)
  #   if @category.save
  #     flash[:info] = "Category was successfully created"
  #     redirect_to @category
  #   else
  #     flash[:info] = "Something went wrong"
  #     render :new, status: :unprocessable_entity
  #   end
  # end

  # def update
  #   if @category.update(category_params)
  #     flash[:info] = "Category was successfully updated"
  #     redirect_to @category
  #   else
  #     render :edit, status: :unprocessable_entity
  #   end
  # end

  # def destroy
  #   @category.destroy
  # end

  # private
  # def set_category
  #   @category = Category.find(params[:id])
  # end

  # def category_params
  #   params.require(:category).permit(:name, :description)
  # end
end
