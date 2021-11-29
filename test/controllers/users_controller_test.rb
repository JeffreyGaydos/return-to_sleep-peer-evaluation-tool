require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @base_title = "Peer Evaluation Tool - "
  end

  test "should get sign up" do
    get "/sign_up"
    assert_response :success
    assert_select "title", "#{@base_title}Sign Up"
  end
    
  test "invalid sign-up should not create a new user" do
    get "/sign_up"
    assert_no_difference 'User.count' do
      post "/users", params: { user: { name: "", email: "", password: "", password_confirmation: ""}}
    end
  end

  test "invalid sign-up should trigger error messages" do
    get "/sign_up"
    post "/users", params: { user: { name: "", email: "", password: "", password_confirmation: ""}}
    assert_select "#error-explanation"
  end

  test "valid sign-up should create a new user" do
    get "/sign_up"
    assert_difference 'User.count', 1 do
      post "/users", params: { user: { name: "Jeffrey Gaydos", email: "jg@osu.edu", password: "SomethingC00l", password_confirmation: "SomethingC00l"}}
    end
  end

end
