require "test_helper"

class ExtraPerformanceVideosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @extra_performance_video = extra_performance_videos(:one)
  end

  test "should get index" do
    get extra_performance_videos_url, as: :json
    assert_response :success
  end

  test "should create extra_performance_video" do
    assert_difference('ExtraPerformanceVideo.count') do
      post extra_performance_videos_url, params: { extra_performance_video: { title: @extra_performance_video.title, video_url: @extra_performance_video.video_url } }, as: :json
    end

    assert_response 201
  end

  test "should show extra_performance_video" do
    get extra_performance_video_url(@extra_performance_video), as: :json
    assert_response :success
  end

  test "should update extra_performance_video" do
    patch extra_performance_video_url(@extra_performance_video), params: { extra_performance_video: { title: @extra_performance_video.title, video_url: @extra_performance_video.video_url } }, as: :json
    assert_response 200
  end

  test "should destroy extra_performance_video" do
    assert_difference('ExtraPerformanceVideo.count', -1) do
      delete extra_performance_video_url(@extra_performance_video), as: :json
    end

    assert_response 204
  end
end
