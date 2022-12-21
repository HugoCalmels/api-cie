class Api::V1::PaysageTempImagesController < ApplicationController
  
  before_action :set_paysage_temp_image, only: [:show, :update, :destroy]

  # GET /dessin_temp_images
  def index
    @paysage_temp_images = PaysageTempImage.all

    render json: @paysage_temp_images
  end

  # GET /dessin_temp_images/1
  def show
    render json: @paysage_temp_image
  end

  # POST /dessin_temp_images
  def create
    @paysage_temp_image = PaysageTempImage.new(paysage_temp_image_params)

    if @paysage_temp_image.save
      render json: @paysage_temp_image, status: :created, location: @paysage_temp_image
    else
      render json: @paysage_temp_image.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /dessin_temp_images/1
  def update
    if @paysage_temp_image.update(paysage_temp_image_params)
      render json: @paysage_temp_image
    else
      render json: @paysage_temp_image.errors, status: :unprocessable_entity
    end
  end

  # DELETE /dessin_temp_images/1
  def destroy
    @paysage_temp_image.destroy
  end


  def latest
    @paysage_temp_image = PaysageTempImage.last

    render json: PaysageTempImageSerializer.new(@paysage_temp_image).serializable_hash[:data][:attributes]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_paysage_temp_image
      @paysage_temp_image = PaysageTempImage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def paysage_temp_image_params
      params.require(:paysage_temp_image).permit(:image)
    end
end
