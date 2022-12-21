class Api::V1::DessinsController < ApplicationController
  def index
    @dessins = Dessin.all
    render json: @dessins
  end

  def show 
    @dessin = Dessin.find(params[:id])
    render json: @dessin
  end

  def create
    puts "HELO??"
    puts "HELO??"
    puts "HELO??"
    puts "HELO??"
    puts "HELO??"
    puts "HELO??"
    @dessin= Dessin.new(dessin_params)
    if @dessin.save
      render json: @dessin
    else
      render error: { error: "Unable to create dessin category"}, status: 400
    end
  end

  def update
    @dessin = Dessin.find(params[:id])
    if @dessin
      @dessin.update(dessin_params)
      render json: @dessin, status: 200
    else
      render json: { error: "Unable to update dessin category" }, status: 400
    end
  end

  def destroy 
    @dessin = Dessin.find(params[:id])
    id = @dessin.id
    if @dessin
      @dessin.destroy
      render json: { message: "Dessin id:"+id.to_s+" category destroyed"}, status: 200
    else
      render json: { error: "Unable to delete dessin category"}, status: 400
    end
  end

  def getAllDessins
    @dessins_categories = DessinCategory.all 
    render json: @dessins_categories, include: [:dessins]
  end

  

  private

  def dessin_params
    params.require(:dessin).permit(:title, :dessin_category_id, :image_url, :height, :width, :material, :ref, :has_to_be_displayed, :index)
  end



end
