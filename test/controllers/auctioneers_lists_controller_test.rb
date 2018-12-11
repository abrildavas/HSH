require 'test_helper'

class AuctioneersListsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get auctioneers_lists_show_url
    assert_response :success
  end

end
