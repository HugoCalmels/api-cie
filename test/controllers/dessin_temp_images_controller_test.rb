require "test_helper"

class DessinTempImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dessin_temp_image = dessin_temp_images(:one)
  end

  test "should get index" do
    get dessin_temp_images_url, as: :json
    assert_response :success
  end

  test "should create dessin_temp_image" do
    assert_difference('DessinTempImage.count') do
      post dessin_temp_images_url, params: { dessin_temp_image: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show dessin_temp_image" do
    get dessin_temp_image_url(@dessin_temp_image), as: :json
    assert_response :success
  end

  test "should update dessin_temp_image" do
    patch dessin_temp_image_url(@dessin_temp_image), params: { dessin_temp_image: {  } }, as: :json
    assert_response 200
  end

  test "should destroy dessin_temp_image" do
    assert_difference('DessinTempImage.count', -1) do
      delete dessin_temp_image_url(@dessin_temp_image), as: :json
    end

    assert_response 204
  end
end
