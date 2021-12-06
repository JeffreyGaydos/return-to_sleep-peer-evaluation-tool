require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  def setup
    @course = Course.new(name: "Web Apps CSE", class_number: 3901)
    @bad_course = Course.new()
    @user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
    @user2 = User.new(name: "Example User2", email: "user2@example.com", password: "foobar", password_confirmation: "foobar")
  end

  test "Base Case without user" do
    assert @course.valid?
  end

  test "Missing class_number is invalid" do
    assert_not @bad_course.valid?
  end

  test "Base Case with user" do
    @course.users << @user
    @course.users << @user2
    assert @course.valid?
  end
  
end
