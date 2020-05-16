require 'test_helper'

class InformationControllerTest < ActionDispatch::IntegrationTest
  test "should get all" do
    get information_all_url
    assert_response :success
  end

  test "should get order" do
    get information_order_url
    assert_response :success
  end

  test "should get calc" do
    get information_calc_url
    assert_response :success
  end

end
