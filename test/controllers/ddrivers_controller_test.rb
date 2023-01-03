require "test_helper"

class DdriversControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ddrivers_index_url
    assert_response :success
  end

  test "should get show" do
    get ddrivers_show_url
    assert_response :success
  end

  test "should get update" do
    get ddrivers_update_url
    assert_response :success
  end

  test "should get new" do
    get ddrivers_new_url
    assert_response :success
  end
end
