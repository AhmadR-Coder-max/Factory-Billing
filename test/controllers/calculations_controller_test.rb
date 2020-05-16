require 'test_helper'

class CalculationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get calculations_index_url
    assert_response :success
  end

  test "should get show" do
    get calculations_show_url
    assert_response :success
  end

  test "should get new" do
    get calculations_new_url
    assert_response :success
  end

  test "should get edit" do
    get calculations_edit_url
    assert_response :success
  end

  test "should get delete" do
    get calculations_delete_url
    assert_response :success
  end

end
