
class Api::V1::ThumbnailPreviewsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  before_action :set_thumbnail_preview, only: [:show, :update, :destroy]

  # GET /thumbnail_previews
  def index
    @thumbnail_previews = ThumbnailPreview.all

    render json: @thumbnail_previews
  end

  # GET /thumbnail_previews/1
  def show
    render json: @thumbnail_preview
  end

  # POST /thumbnail_previews
  def create
    @thumbnail_preview = ThumbnailPreview.new(thumbnail_preview_params)

    if @thumbnail_preview.save
      render json: @thumbnail_preview, status: :created, location: @thumbnail_preview
    else
      render json: @thumbnail_preview.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /thumbnail_previews/1
  def update
    if @thumbnail_preview.update(thumbnail_preview_params)
      render json: @thumbnail_preview
    else
      render json: @thumbnail_preview.errors, status: :unprocessable_entity
    end
  end

  # DELETE /thumbnail_previews/1
  def destroy
    @thumbnail_preview.destroy
  end

  def getLink 

    puts "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
    puts "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
    puts "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
    puts "GET LINK THUMBNAIL"
    puts params
    puts params[:object][:link]
    puts "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
    puts "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
    puts "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
    puts "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
   object = LinkThumbnailer.generate(params[:object][:link])
   render json: object
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_thumbnail_preview
      @thumbnail_preview = ThumbnailPreview.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def thumbnail_preview_params
      params.fetch(:thumbnail_preview, {})
    end
end
