require "test_helper"

class ThumbnailPreviewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @thumbnail_preview = thumbnail_previews(:one)
  end

  test "should get index" do
    get thumbnail_previews_url, as: :json
    assert_response :success
  end

  test "should create thumbnail_preview" do
    assert_difference('ThumbnailPreview.count') do
      post thumbnail_previews_url, params: { thumbnail_preview: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show thumbnail_preview" do
    get thumbnail_preview_url(@thumbnail_preview), as: :json
    assert_response :success
  end

  test "should update thumbnail_preview" do
    patch thumbnail_preview_url(@thumbnail_preview), params: { thumbnail_preview: {  } }, as: :json
    assert_response 200
  end

  test "should destroy thumbnail_preview" do
    assert_difference('ThumbnailPreview.count', -1) do
      delete thumbnail_preview_url(@thumbnail_preview), as: :json
    end

    assert_response 204
  end
end
