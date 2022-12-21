class Api::V1::CarnetCategoriesController < ApplicationController

  def index
    @carnet_categories = CarnetCategory.all
    render json: @carnet_categories
  end

  def show 
    @carnet_category = CarnetCategory.find(params[:id])
    render json: @carnet_category
  end

  def create
    @carnet_category = CarnetCategory.new(carnet_category_params)
    if @carnet_category.save
      render json: @carnet_category
    else
      render error: { error: "Unable to create carnet category"}, status: 400
    end
  end

  def update
    @carnet_category = CarnetCategory.find(params[:id])
    if @carnet_category
      @carnet_category.update(carnet_category_params)
      render json: { message: "Carnet category successfully updated"}, status: 200
    else
      render json: { error: "Unable to update carnet category" }, status: 400
    end
  end

  def destroy 
    @carnet_category = CarnetCategory.find(params[:id])
    if @carnet_category
      @carnet_category.destroy
      render json: { message: "Carnet category destroyed"}, status: 200
    else
      render json: { error: "Unable to delete carnet category"}, status: 400
    end
  end

  private

  def carnet_category_params
    params.require(:carnet_category).permit(:title)
  end



end
