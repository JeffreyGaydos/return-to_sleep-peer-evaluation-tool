require 'test_helper'

class CourseUserTest < ActiveSupport::TestCase
  def setup
    @course = Course.new(class_number: 3901)
    @course2 = Course.new(class_number: 3902)
    @user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
    @user2 = User.new(name: "Example User2", email: "user2@example.com", password: "foobar", password_confirmation: "foobar")
    @course_user = CourseUser.new(course: @course, user: @user)
  end

  test "Base case is valid" do
    assert @course_user.valid?
  end

  test "No duplicate course-user pairs" do
    @course_user.save()
    course_user2 = CourseUser.new(course: @course, user: @user)
    assert_not course_user2.valid?
  end

  test "Pairs can have same course with different users" do
    @course_user.save()
    course_user2 = CourseUser.new(course: @course, user: @user2)
    assert course_user2.valid?
  end

  test "Pairs can have same user with different courses" do
    @course_user.save()
    course_user2 = CourseUser.new(course: @course2, user: @user)
    assert course_user2.valid?
  end

  test "Dissallow invalid users in relation" do
    bad_user = User.new(name: "", email: "", password: "", password_confirmation: "")
    bad_course_user = CourseUser.new(course: @course, user: bad_user)
    assert_not bad_course_user.valid?
  end

  test "Dissallow invalid courses in relation" do
    bad_course = Course.new()
    bad_course_user = CourseUser.new(course: bad_course, user: @user)
    assert_not bad_course_user.valid?
  end
end
