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

  test "Log in valid user" do
    User.create(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
    get '/login'
    assert_template 'login/init'
    post '/login', params: { session: { email: "user@example.com", password: "foobar" } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "title", "#{@base_title}Account"
    assert session[:user_id]
  end

  test "Log out valid, logged in user" do
    User.create(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
    get '/login'
    assert_template 'login/init'
    post '/login', params: { session: { email: "user@example.com", password: "foobar" } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "title", "#{@base_title}Account"
    assert session[:user_id]
    get '/logout'
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "title", "#{@base_title}Home"
    assert_nil session[:user_id]
  end

end
