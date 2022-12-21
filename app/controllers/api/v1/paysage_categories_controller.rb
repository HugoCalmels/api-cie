class Api::V1::PaysageCategoriesController < ApplicationController
 
  def index
    @paysage_categories = PaysageCategory.all
    render json: @paysage_categories
  end

  def show 
    @paysage_category = PaysageCategory.find(params[:id])
    render json: @paysage_category
  end

  def create
    @paysage_category = PaysageCategory.new(paysage_category_params)
    if @paysage_category.save
      render json: @paysage_category
    else
      render error: { error: "Unable to create dessin category"}, status: 400
    end
  end

  def update
    @paysage_category = PaysageCategory.find(params[:id])
    if @paysage_category
      @paysage_category.update(paysage_category_params)
      render json: { message: "Dessin category successfully updated"}, status: 200
    else
      render json: { error: "Unable to update dessin category" }, status: 400
    end
  end

  def destroy 
    @paysage_category = PaysageCategory.find(params[:id])
    if @paysage_category
      @paysage_category.destroy
      render json: { message: "Dessin category destroyed"}, status: 200
    else
      render json: { error: "Unable to delete dessin category"}, status: 400
    end
  end

  private

  def paysage_category_params
    params.require(:paysage_category).permit(:title)
  end

end
