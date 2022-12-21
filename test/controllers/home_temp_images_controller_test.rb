require "test_helper"

class HomeTempImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @home_temp_image = home_temp_images(:one)
  end

  test "should get index" do
    get home_temp_images_url, as: :json
    assert_response :success
  end

  test "should create home_temp_image" do
    assert_difference('HomeTempImage.count') do
      post home_temp_images_url, params: { home_temp_image: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show home_temp_image" do
    get home_temp_image_url(@home_temp_image), as: :json
    assert_response :success
  end

  test "should update home_temp_image" do
    patch home_temp_image_url(@home_temp_image), params: { home_temp_image: {  } }, as: :json
    assert_response 200
  end

  test "should destroy home_temp_image" do
    assert_difference('HomeTempImage.count', -1) do
      delete home_temp_image_url(@home_temp_image), as: :json
    end

    assert_response 204
  end
end
