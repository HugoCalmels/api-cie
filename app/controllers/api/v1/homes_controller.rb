class Api::V1::HomesController < ApplicationController
  def index
    #@homes = Home.all
    #render json: @homes

    @test = Type.all
    render json: @test, include: [:homes]
  end

  def show 
    @home = Home.find(params[:id])
    render json: @home
  end

  def create
    @home= Home.new(home_params)
    if @home.save
      render json: @home
    else
      render error: { error: "Unable to create home category"}, status: 400
    end
  end

  def update
    @home = Home.find(params[:id])
    if @home
      @home.update(home_params)
      render json: @home, status: 200
    else
      render json: { error: "Unable to update home category" }, status: 400
    end
  end

  def destroy 
    @home = Home.find(params[:id])
    id = @home.id
    if @home
      @home.destroy
      render json: { message: "Home id:"+id.to_s+" category destroyed"}, status: 200
    else
      render json: { error: "Unable to delete home category"}, status: 400
    end
  end

  def getAllHomes
    @homes = Home.all 
    render json: @homes
  end

  

  private

  def home_params
    params.require(:home).permit(:type_id, :image_url)
  end

end
