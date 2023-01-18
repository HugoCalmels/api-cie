class Api::V1::PerformanceTempVideosController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  before_action :set_performance_temp_video, only: [:show, :update, :destroy]

  # GET /performance_temp_videos
  def index
    @performance_temp_videos = PerformanceTempVideo.all

    render json: @performance_temp_videos
  end

  # GET /performance_temp_videos/1
  def show
    render json: @performance_temp_video
  end

  def latest
    @performance_temp_video = PerformanceTempVideo.last

    render json: PerformanceTempVideoSerializer.new(@performance_temp_video).serializable_hash[:data][:attributes]
  end

  # POST /performance_temp_videos
  def create
    @performance_temp_video = PerformanceTempVideo.new(performance_temp_video_params)

    if @performance_temp_video.save
      render json: @performance_temp_video
    else
      render json: @performance_temp_video.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /performance_temp_videos/1
  def update
    if @performance_temp_video.update(performance_temp_video_params)
      render json: @performance_temp_video
    else
      render json: @performance_temp_video.errors, status: :unprocessable_entity
    end
  end

  # DELETE /performance_temp_videos/1
  def destroy
    @performance_temp_video.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_performance_temp_video
      @performance_temp_video = PerformanceTempVideo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def performance_temp_video_params
      params.require(:performance_temp_video).permit(:video)

    end
end
