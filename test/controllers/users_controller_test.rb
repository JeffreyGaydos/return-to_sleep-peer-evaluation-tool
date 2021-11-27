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
    
    assert_select "#error-explanation"
  end

end
