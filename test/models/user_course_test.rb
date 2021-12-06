require 'test_helper'

class UserCourseTest < ActiveSupport::TestCase
  def setup
    @course = Course.new(class_number: 3901, name:"3901, web dev")
    @course2 = Course.new(class_number: 3902, name:"3902, c c dev")

    @user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
    @user2 = User.new(name: "Example User2", email: "user2@example.com", password: "foobar", password_confirmation: "foobar")

    @user_course = UserCourse.new(user: @user, course: @course)
  end

  test "Base case is valid" do
    assert @user_course.valid?
  end

  test "No duplicate user-course pairs" do
    @user_course.save()
    user_course2 = UserCourse.new(user: @user, course: @course)
    assert_not user_course2.valid?
  end

  test "Pairs can have same user with different courses" do
    @user_course.save()
    user_course2 = UserCourse.new(user: @user, course: @course2)
    assert user_course2.valid?
  end

  test "Pairs can have same course with different users" do
    @user_course.save()
    user_course2 = UserCourse.new(user: @user2, course: @course)
    assert user_course2.valid?
  end
end
