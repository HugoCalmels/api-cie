class Api::V1::CarnetsController < ApplicationController
  def index
    @carnets = Carnets.all
    render json: @carnets
  end

  def show 
    @carnet = Carnet.find(params[:id])
    render json: @carnet
  end

  def create
    puts "HELO??"
    puts "HELO??"
    puts "HELO??"
    puts "HELO??"
    puts "HELO??"
    puts "HELO??"
    @carnet= Carnet.new(carnet_params)
    if @carnet.save
      render json: @carnet
    else
      render error: { error: "Unable to create dessin category"}, status: 400
    end
  end

  def update
    @carnet = Carnet.find(params[:id])
    if @carnet
      @carnet.update(carnet_params)
      render json: @carnet, status: 200
    else
      render json: { error: "Unable to update dessin category" }, status: 400
    end
  end

  def destroy 
    @carnet = Carnet.find(params[:id])
    id = @carnet.id
    if @carnet
      @carnet.destroy
      render json: { message: "Carnet id:"+id.to_s+" category destroyed"}, status: 200
    else
      render json: { error: "Unable to delete dessin category"}, status: 400
    end
  end

  def getAllCarnets
    @carnets_categories = CarnetCategory.all 
    render json: @carnets_categories, include: [:carnets]
  end

  

  private

  def carnet_params
    params.require(:carnet).permit(:title, :carnet_category_id, :image_url, :height, :width, :material, :ref, :has_to_be_displayed, :index)
  end



end
