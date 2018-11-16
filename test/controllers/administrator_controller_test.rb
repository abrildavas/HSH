require 'test_helper'

class AdministratorControllerTest < ActionDispatch::IntegrationTest
  test "should get default" do
    get administrator_default_url
    assert_response :success
  end

end
