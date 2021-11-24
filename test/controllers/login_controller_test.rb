require 'test_helper'

class LoginControllerTest < ActionDispatch::IntegrationTest
  test "should get init" do
    get login_init_url
    assert_response :success
  end

end
