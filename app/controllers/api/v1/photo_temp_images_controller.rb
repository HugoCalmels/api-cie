class Api::V1::PhotoTempImagesController < ApplicationController
  before_action :set_photo_temp_image, only: [:show, :update, :destroy]

  # GET /photo_temp_images
  def index
    @photo_temp_images = PhotoTempImage.all

    render json: @photo_temp_images
  end

  # GET /photo_temp_images/1
  def show
    render json: @photo_temp_image
  end

  # POST /photo_temp_images
  def create
    @photo_temp_image = PhotoTempImage.new(photo_temp_image_params)

    puts "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
    puts "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
    puts photo_temp_image_params
    puts "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
    puts "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"

    if @photo_temp_image.save
      render json: @photo_temp_image
    else
      render json: @photo_temp_image.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /photo_temp_images/1
  def update
    if @photo_temp_image.update(photo_temp_image_params)
      render json: @photo_temp_image
    else
      render json: @photo_temp_image.errors, status: :unprocessable_entity
    end
  end

  # DELETE /photo_temp_images/1
  def destroy
    @photo_temp_image.destroy
  end

  def latest
    @photo_temp_image = PhotoTempImage.last

    render json: PhotoTempImageSerializer.new(@photo_temp_image).serializable_hash[:data][:attributes]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo_temp_image
      @photo_temp_image = PhotoTempImage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def photo_temp_image_params
      params.require(:photo_temp_image).permit(:image)
    end
end
