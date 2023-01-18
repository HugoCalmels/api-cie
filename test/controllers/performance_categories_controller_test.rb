require "test_helper"

class PerformanceCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @performance_category = performance_categories(:one)
  end

  test "should get index" do
    get performance_categories_url, as: :json
    assert_response :success
  end

  test "should create performance_category" do
    assert_difference('PerformanceCategory.count') do
      post performance_categories_url, params: { performance_category: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show performance_category" do
    get performance_category_url(@performance_category), as: :json
    assert_response :success
  end

  test "should update performance_category" do
    patch performance_category_url(@performance_category), params: { performance_category: {  } }, as: :json
    assert_response 200
  end

  test "should destroy performance_category" do
    assert_difference('PerformanceCategory.count', -1) do
      delete performance_category_url(@performance_category), as: :json
    end

    assert_response 204
  end
end
