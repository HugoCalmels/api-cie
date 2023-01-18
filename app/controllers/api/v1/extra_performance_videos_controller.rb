class Api::V1::ExtraPerformanceVideosController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  before_action :set_extra_performance_video, only: [:show, :update, :destroy]

  # GET /extra_performance_videos
  def index
    @extra_performance_videos = ExtraPerformanceVideo.all

    render json: @extra_performance_videos
  end

  # GET /extra_performance_videos/1
  def show
    render json: @extra_performance_video
  end

  # POST /extra_performance_videos
  def create
    @extra_performance_video = ExtraPerformanceVideo.new(extra_performance_video_params)

    if @extra_performance_video.save
      render json: @extra_performance_video
    else
      render json: @extra_performance_video.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /extra_performance_videos/1
  def update
    if @extra_performance_video.update(extra_performance_video_params)
      render json: @extra_performance_video
    else
      render json: @extra_performance_video.errors, status: :unprocessable_entity
    end
  end

  # DELETE /extra_performance_videos/1
  def destroy
    @extra_performance_video.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_extra_performance_video
      @extra_performance_video = ExtraPerformanceVideo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def extra_performance_video_params
      params.require(:extra_performance_video).permit(:title, :video_url, :performance_id)
    end
end
