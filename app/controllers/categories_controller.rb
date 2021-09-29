class CategoriesController < ApplicationController

  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.all
  end
  
  def new
    @category = Category.new
    render :form
  end

  # GET /categories/1/edit
  def edit
    @category = Category.find(params[:id])
    render :form
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(category_params)
    save_category
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    @category = Category.find(params[:id])
    @category.assign_attributes(category_params)
    save_category
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    @categories = Category.all
    redirect_to '/categories'
  end

  def save_category
    if @category.save
      @categories = Category.all
      redirect_to '/categories'
    else
      render :form
    end
  end

  def category_params
	# If we want to use a param (e.g. description), we have to permit the usage
    params.require(:category).permit(:name)
  end
end
