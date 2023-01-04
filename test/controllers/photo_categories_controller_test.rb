require "test_helper"

class PhotoCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @photo_category = photo_categories(:one)
  end

  test "should get index" do
    get photo_categories_url, as: :json
    assert_response :success
  end

  test "should create photo_category" do
    assert_difference('PhotoCategory.count') do
      post photo_categories_url, params: { photo_category: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show photo_category" do
    get photo_category_url(@photo_category), as: :json
    assert_response :success
  end

  test "should update photo_category" do
    patch photo_category_url(@photo_category), params: { photo_category: {  } }, as: :json
    assert_response 200
  end

  test "should destroy photo_category" do
    assert_difference('PhotoCategory.count', -1) do
      delete photo_category_url(@photo_category), as: :json
    end

    assert_response 204
  end
end
