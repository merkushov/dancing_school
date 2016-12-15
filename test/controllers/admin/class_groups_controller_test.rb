require 'test_helper'

class Admin::ClassGroupsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_class_groups_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_class_groups_show_url
    assert_response :success
  end

  test "should get new" do
    get admin_class_groups_new_url
    assert_response :success
  end

  test "should get edit" do
    get admin_class_groups_edit_url
    assert_response :success
  end

end
