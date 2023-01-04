require "test_helper"

class PhotoTempImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @photo_temp_image = photo_temp_images(:one)
  end

  test "should get index" do
    get photo_temp_images_url, as: :json
    assert_response :success
  end

  test "should create photo_temp_image" do
    assert_difference('PhotoTempImage.count') do
      post photo_temp_images_url, params: { photo_temp_image: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show photo_temp_image" do
    get photo_temp_image_url(@photo_temp_image), as: :json
    assert_response :success
  end

  test "should update photo_temp_image" do
    patch photo_temp_image_url(@photo_temp_image), params: { photo_temp_image: {  } }, as: :json
    assert_response 200
  end

  test "should destroy photo_temp_image" do
    assert_difference('PhotoTempImage.count', -1) do
      delete photo_temp_image_url(@photo_temp_image), as: :json
    end

    assert_response 204
  end
end
