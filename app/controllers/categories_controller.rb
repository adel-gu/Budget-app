class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = Category.where(author: current_user)
  end

  def show
    @category = Category.find(params[:category_id])
  end

  def new
    @category = Category.new
    respond_to do |format|
      format.html { render :new, locals: { category: @category } }
    end
  end

  def create
    @category = Category.new(category_params)

    respond_to do |format|
      format.html do
        if @category.save
          flash[:sucess] = 'Category Saved Successfully'
          redirect_to categories_path
        else
          flash.now[:error] = 'Error: The New Category could not be saved'
          render :new, locals: { category: @category }
        end
      end
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon).merge(author: current_user)
  end
end
