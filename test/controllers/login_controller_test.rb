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

  test "Deny login with invalid credentials" do
    get '/login'
    assert_template 'login/init'
    post '/login', params: { session: { email: "", password: "" } }
    assert_template 'login/init'
    assert_not flash.empty?
    get '/'
    assert flash.empty?
  end

end
