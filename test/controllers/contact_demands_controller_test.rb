require "test_helper"

class ContactDemandsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contact_demand = contact_demands(:one)
  end

  test "should get index" do
    get contact_demands_url, as: :json
    assert_response :success
  end

  test "should create contact_demand" do
    assert_difference('ContactDemand.count') do
      post contact_demands_url, params: { contact_demand: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show contact_demand" do
    get contact_demand_url(@contact_demand), as: :json
    assert_response :success
  end

  test "should update contact_demand" do
    patch contact_demand_url(@contact_demand), params: { contact_demand: {  } }, as: :json
    assert_response 200
  end

  test "should destroy contact_demand" do
    assert_difference('ContactDemand.count', -1) do
      delete contact_demand_url(@contact_demand), as: :json
    end

    assert_response 204
  end
end
