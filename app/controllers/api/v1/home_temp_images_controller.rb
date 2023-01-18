
  class Api::V1::HomeTempImagesController < ApplicationController
    before_action :authenticate_user!, only: [:create, :update, :destroy]
    before_action :set_home_temp_image, only: [:show, :update, :destroy]
  
    # GET /dessin_temp_images
    def index
      @home_temp_images = HomeTempImage.all
  
      render json: @home_temp_images
    end
  
    # GET /dessin_temp_images/1
    def show
      render json: @home_temp_image
    end
  
    # POST /dessin_temp_images
    def create
      @home_temp_image = HomeTempImage.new(home_temp_image_params)
  
      if @home_temp_image.save
        render json: @home_temp_image
      else
        render json: @home_temp_image.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /dessin_temp_images/1
    def update
      if @home_temp_image.update(home_temp_image_params)
        render json: @home_temp_image
      else
        render json: @home_temp_image.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /dessin_temp_images/1
    def destroy
      @home_temp_image.destroy
    end
  
  
    def latest
      @home_temp_image = HomeTempImage.last
  
      render json: HomeTempImageSerializer.new(@home_temp_image).serializable_hash[:data][:attributes]
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_home_temp_image
        @home_temp_image = HomeTempImage.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def home_temp_image_params
        params.require(:home_temp_image).permit(:image)
      end
  end
  

