require 'test_helper'

class HotSalesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get hot_sales_show_url
    assert_response :success
  end

  test "should get index" do
    get hot_sales_index_url
    assert_response :success
  end

end
