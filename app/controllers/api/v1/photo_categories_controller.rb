class Api::V1::PhotoCategoriesController < ApplicationController
  before_action :set_photo_category, only: [:show, :update, :destroy]

  # GET /photo_categories
  def index
    @photo_categories = PhotoCategory.all

    render json: @photo_categories
  end

  # GET /photo_categories/1
  def show
    render json: @photo_category
  end

  # POST /photo_categories
  def create
    @photo_category = PhotoCategory.new(photo_category_params)

    if @photo_category.save
      render json: @photo_category
    else
      render json: @photo_category.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /photo_categories/1
  def update
    if @photo_category.update(photo_category_params)
      render json: @photo_category
    else
      render json: @photo_category.errors, status: :unprocessable_entity
    end
  end

  # DELETE /photo_categories/1
  def destroy
    @photo_category.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo_category
      @photo_category = PhotoCategory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def photo_category_params
      params.require(:photo_category).permit(:title)
    end
end
