require "test_helper"

class CarnetTempImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @carnet_temp_image = carnet_temp_images(:one)
  end

  test "should get index" do
    get carnet_temp_images_url, as: :json
    assert_response :success
  end

  test "should create carnet_temp_image" do
    assert_difference('CarnetTempImage.count') do
      post carnet_temp_images_url, params: { carnet_temp_image: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show carnet_temp_image" do
    get carnet_temp_image_url(@carnet_temp_image), as: :json
    assert_response :success
  end

  test "should update carnet_temp_image" do
    patch carnet_temp_image_url(@carnet_temp_image), params: { carnet_temp_image: {  } }, as: :json
    assert_response 200
  end

  test "should destroy carnet_temp_image" do
    assert_difference('CarnetTempImage.count', -1) do
      delete carnet_temp_image_url(@carnet_temp_image), as: :json
    end

    assert_response 204
  end
end
