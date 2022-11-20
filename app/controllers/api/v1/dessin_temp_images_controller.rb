class Api::V1::DessinTempImagesController < ApplicationController

  before_action :set_dessin_temp_image, only: [:show, :update, :destroy]

  # GET /dessin_temp_images
  def index
    @dessin_temp_images = DessinTempImage.all

    render json: @dessin_temp_images
  end

  # GET /dessin_temp_images/1
  def show
    render json: @dessin_temp_image
  end

  # POST /dessin_temp_images
  def create
    puts "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
    puts "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
    puts "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
    puts params
    puts "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
    puts "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
    puts "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
    @dessin_temp_image = DessinTempImage.new(dessin_temp_image_params)

    if @dessin_temp_image.save
      render json: @dessin_temp_image, status: :created, location: @dessin_temp_image
    else
      render json: @dessin_temp_image.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /dessin_temp_images/1
  def update
    if @dessin_temp_image.update(dessin_temp_image_params)
      render json: @dessin_temp_image
    else
      render json: @dessin_temp_image.errors, status: :unprocessable_entity
    end
  end

  # DELETE /dessin_temp_images/1
  def destroy
    @dessin_temp_image.destroy
  end


  def latest
    @dessin_temp_image = DessinTempImage.last

    render json: DessinTempImageSerializer.new(@dessin_temp_image).serializable_hash[:data][:attributes]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dessin_temp_image
      @dessin_temp_image = DessinTempImage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dessin_temp_image_params
      params.require(:dessin_temp_image).permit(:image)
    end
end
