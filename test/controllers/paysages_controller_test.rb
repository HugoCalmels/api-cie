require "test_helper"

class PaysagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @paysage = paysages(:one)
  end

  test "should get index" do
    get paysages_url, as: :json
    assert_response :success
  end

  test "should create paysage" do
    assert_difference('Paysage.count') do
      post paysages_url, params: { paysage: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show paysage" do
    get paysage_url(@paysage), as: :json
    assert_response :success
  end

  test "should update paysage" do
    patch paysage_url(@paysage), params: { paysage: {  } }, as: :json
    assert_response 200
  end

  test "should destroy paysage" do
    assert_difference('Paysage.count', -1) do
      delete paysage_url(@paysage), as: :json
    end

    assert_response 204
  end
end
