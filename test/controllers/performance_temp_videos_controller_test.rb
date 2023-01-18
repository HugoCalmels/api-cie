require "test_helper"

class PerformanceTempVideosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @performance_temp_video = performance_temp_videos(:one)
  end

  test "should get index" do
    get performance_temp_videos_url, as: :json
    assert_response :success
  end

  test "should create performance_temp_video" do
    assert_difference('PerformanceTempVideo.count') do
      post performance_temp_videos_url, params: { performance_temp_video: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show performance_temp_video" do
    get performance_temp_video_url(@performance_temp_video), as: :json
    assert_response :success
  end

  test "should update performance_temp_video" do
    patch performance_temp_video_url(@performance_temp_video), params: { performance_temp_video: {  } }, as: :json
    assert_response 200
  end

  test "should destroy performance_temp_video" do
    assert_difference('PerformanceTempVideo.count', -1) do
      delete performance_temp_video_url(@performance_temp_video), as: :json
    end

    assert_response 204
  end
end
