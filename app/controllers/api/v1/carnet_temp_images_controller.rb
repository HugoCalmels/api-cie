class Api::V1::CarnetTempImagesController < ApplicationController

  before_action :set_carnet_temp_image, only: [:show, :update, :destroy]

  # GET /dessin_temp_images
  def index
    @carnet_temp_images = CarnetTempImage.all

    render json: @carnet_temp_images
  end

  # GET /dessin_temp_images/1
  def show
    render json: @carnet_temp_image
  end

  # POST /dessin_temp_images
  def create
    @carnet_temp_image = CarnetTempImage.new(carnet_temp_image_params)

    if @carnet_temp_image.save
      render json: @carnet_temp_image, status: :created, location: @carnet_temp_image
    else
      render json: @carnet_temp_image.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /carnet_temp_images/1
  def update
    if @carnet_temp_image.update(carnet_temp_image_params)
      render json: @carnet_temp_image
    else
      render json: @carnet_temp_image.errors, status: :unprocessable_entity
    end
  end

  # DELETE /carnet_temp_images/1
  def destroy
    @carnet_temp_image.destroy
  end


  def latest
    @carnet_temp_image = CarnetTempImage.last

    render json: CarnetTempImageSerializer.new(@carnet_temp_image).serializable_hash[:data][:attributes]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_carnet_temp_image
      @carnet_temp_image = CarnetTempImage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def carnet_temp_image_params
      params.require(:carnet_temp_image).permit(:image)
    end
end
