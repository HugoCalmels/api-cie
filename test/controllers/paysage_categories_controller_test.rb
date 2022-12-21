require "test_helper"

class PaysageCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @paysage_category = paysage_categories(:one)
  end

  test "should get index" do
    get paysage_categories_url, as: :json
    assert_response :success
  end

  test "should create paysage_category" do
    assert_difference('PaysageCategory.count') do
      post paysage_categories_url, params: { paysage_category: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show paysage_category" do
    get paysage_category_url(@paysage_category), as: :json
    assert_response :success
  end

  test "should update paysage_category" do
    patch paysage_category_url(@paysage_category), params: { paysage_category: {  } }, as: :json
    assert_response 200
  end

  test "should destroy paysage_category" do
    assert_difference('PaysageCategory.count', -1) do
      delete paysage_category_url(@paysage_category), as: :json
    end

    assert_response 204
  end
end
