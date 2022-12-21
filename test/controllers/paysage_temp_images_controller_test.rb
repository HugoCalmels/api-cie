require "test_helper"

class PaysageTempImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @paysage_temp_image = paysage_temp_images(:one)
  end

  test "should get index" do
    get paysage_temp_images_url, as: :json
    assert_response :success
  end

  test "should create paysage_temp_image" do
    assert_difference('PaysageTempImage.count') do
      post paysage_temp_images_url, params: { paysage_temp_image: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show paysage_temp_image" do
    get paysage_temp_image_url(@paysage_temp_image), as: :json
    assert_response :success
  end

  test "should update paysage_temp_image" do
    patch paysage_temp_image_url(@paysage_temp_image), params: { paysage_temp_image: {  } }, as: :json
    assert_response 200
  end

  test "should destroy paysage_temp_image" do
    assert_difference('PaysageTempImage.count', -1) do
      delete paysage_temp_image_url(@paysage_temp_image), as: :json
    end

    assert_response 204
  end
end
