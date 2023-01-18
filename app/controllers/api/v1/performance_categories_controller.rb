class Api::V1::PerformanceCategoriesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  before_action :set_performance_category, only: [:show, :update, :destroy]

  # GET /performance_categories
  def index
    @performance_categories = PerformanceCategory.all

    render json: @performance_categories
  end

  # GET /performance_categories/1
  def show
    render json: @performance_category
  end

  # POST /performance_categories
  def create
    @performance_category = PerformanceCategory.new(performance_category_params)

    if @performance_category.save
      render json: @performance_category
    else
      render json: @performance_category.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /performance_categories/1
  def update
    if @performance_category.update(performance_category_params)
      render json: @performance_category
    else
      render json: @performance_category.errors, status: :unprocessable_entity
    end
  end

  # DELETE /performance_categories/1
  def destroy
    @performance_category.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_performance_category
      @performance_category = PerformanceCategory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def performance_category_params
      params.require(:performance_category).permit(:title, :released_date)
    end
end
