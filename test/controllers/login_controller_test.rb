require 'test_helper'

class LoginControllerTest < ActionDispatch::IntegrationTest
  def setup
    @base_title = "Peer Evaluation Tool - "
  end

  test "should get login init" do
    get "/login"
    assert_response :success
    assert_select "title", "#{@base_title}Login"
  end
  
  test "should get reset password" do
    get "/reset_password"
    assert_response :success
    assert_select "title", "#{@base_title}Reset Password"
  end

end
