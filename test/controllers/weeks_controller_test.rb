require 'test_helper'

class WeeksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get weeks_index_url
    assert_response :success
  end

  test "should get show" do
    get weeks_show_url
    assert_response :success
  end

  test "should get delete" do
    get weeks_delete_url
    assert_response :success
  end

  test "should get new" do
    get weeks_new_url
    assert_response :success
  end

  test "should get create" do
    get weeks_create_url
    assert_response :success
  end

end
