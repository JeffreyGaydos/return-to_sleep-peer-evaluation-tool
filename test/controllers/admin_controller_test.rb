require 'test_helper'

class AdminsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @base_title = "Peer Evaluation Tool - "
  end

  test "should get sign up instructors" do
    get "/sign_up/instructors"
    assert_response :success
    assert_select "title", "#{@base_title}Instructors' Sign Up"
  end
    
  test "invalid sign-up should not create a new admin-user" do #I define an 'admin-user' to a user that will soon be associated with an admin
    get "/sign_up/instructors"
    assert_no_difference 'User.count' do
      post "/sign_up/instructors", params: { user: { name: "", email: "", password: "", password_confirmation: ""}}
    end
  end

  test "invalid admin-user sign-up should trigger error messages" do
    get "/sign_up/instructors"
    post "/sign_up/instructors", params: { user: { name: "", email: "", password: "", password_confirmation: ""}}
    assert_select "#error-explanation"
  end

  test "valid admin-user sign-up should create a new user" do
    get "/sign_up/instructors"
    assert_difference 'User.count', 1 do
      post "/sign_up/instructors", params: { user: { name: "Jeffrey Gaydos", email: "jg@osu.edu", password: "SomethingC00l", password_confirmation: "SomethingC00l"}}
    end
  end

end
