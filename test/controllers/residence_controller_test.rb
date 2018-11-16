require 'test_helper'

class ResidenceControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get residence_index_url
    assert_response :success
  end

  test "should get show" do
    get residence_show_url
    assert_response :success
  end

  test "should get new" do
    get residence_new_url
    assert_response :success
  end

  test "should get edit" do
    get residence_edit_url
    assert_response :success
  end

end
