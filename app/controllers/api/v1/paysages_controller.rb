class Api::V1::PaysagesController < ApplicationController
  def index
    @paysages = Paysage.all
    render json: @paysages
  end

  def show 
    @paysage = Paysage.find(params[:id])
    render json: @paysage
  end

  def create

    @paysage= Paysage.new(paysages_params)
    if @paysage.save
      render json: @paysage
    else
      render error: { error: "Unable to create dessin category"}, status: 400
    end
  end

  def update
    @paysage = Paysage.find(params[:id])
    if @paysage
      @paysage.update(paysages_params)
      render json: @paysage, status: 200
    else
      render json: { error: "Unable to update dessin category" }, status: 400
    end
  end

  def destroy 
    @paysage = Paysage.find(params[:id])
    id = @paysage.id
    if @paysage
      @paysage.destroy
      render json: { message: "Paysage id:"+id.to_s+" category destroyed"}, status: 200
    else
      render json: { error: "Unable to delete dessin category"}, status: 400
    end
  end

  def getAllPaysages
    @paysages_categories = PaysageCategory.all 
    render json: @paysages_categories, include: [:paysages]
  end

  

  private

  def paysages_params
    params.require(:paysage).permit(:title, :paysage_category_id, :image_url, :height, :width, :material, :ref, :has_to_be_displayed, :index)
  end

end
