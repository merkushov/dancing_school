require 'test_helper'

class Admin::PricesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_prices_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_prices_show_url
    assert_response :success
  end

  test "should get new" do
    get admin_prices_new_url
    assert_response :success
  end

  test "should get edit" do
    get admin_prices_edit_url
    assert_response :success
  end

end
