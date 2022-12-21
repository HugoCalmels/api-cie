class Api::V1::DessinCategoriesController < ApplicationController

  def index
    @dessin_categories = DessinCategory.all
    render json: @dessin_categories
  end

  def show 
    @dessin_category = DessinCategory.find(params[:id])
    render json: @dessin_category
  end

  def create
    @dessin_category = DessinCategory.new(dessin_category_params)
    if @dessin_category.save
      render json: @dessin_category
    else
      render error: { error: "Unable to create dessin category"}, status: 400
    end
  end

  def update
    @dessin_category = DessinCategory.find(params[:id])
    if @dessin_category
      @dessin_category.update(dessin_category_params)
      render json: { message: "Dessin category successfully updated"}, status: 200
    else
      render json: { error: "Unable to update dessin category" }, status: 400
    end
  end

  def destroy 
    @dessin_category = DessinCategory.find(params[:id])
    if @dessin_category
      @dessin_category.destroy
      render json: { message: "Dessin category destroyed"}, status: 200
    else
      render json: { error: "Unable to delete dessin category"}, status: 400
    end
  end

  private

  def dessin_category_params
    params.require(:dessin_category).permit(:title)
  end



end
