require 'test_helper'

class CoursesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  setup do
    @course = Course.new(class_number: 3901, name:"web dev")
    @user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")

    @course.save
    @user.save
  end

  test "should get index" do
    get '/courses'
    assert_response :success
  end

  test "user add course" do
    get '/courses'
    #click_on "Enroll"
    #assert_select 'div.alert-info', flash[:info]
  end


end
