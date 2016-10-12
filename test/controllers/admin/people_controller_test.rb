require 'test_helper'

class Admin::PeopleControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_people_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_people_show_url
    assert_response :success
  end

  test "should get new" do
    get admin_people_new_url
    assert_response :success
  end

  test "should get edit" do
    get admin_people_edit_url
    assert_response :success
  end

end
