require 'test_helper'

class CourseAdminTest < ActiveSupport::TestCase
  def setup
    @course = Course.new(class_number: 3901)
    @course2 = Course.new(class_number: 3902)

    @user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
    @user.save
    @institution = Institution.new(name_id: "OSU")
    @institution.save
    @admin = Admin.new(user: @user, user_id: 1, institution: @institution, institution_id: 1)
    @user2 = User.new(name: "Example User2", email: "user2@example.com", password: "foobar", password_confirmation: "foobar")
    @user2.save
    @admin2 = Admin.new(user: @user2, user_id: 1, institution: @institution, institution_id: 1)

    @course_admin = CourseAdmin.new(course: @course, admin: @admin)
  end

  test "Base case is valid" do
    assert @course_admin.valid?
  end

  test "No duplicate course-admin pairs" do
    @course_admin.save()
    course_admin2 = CourseAdmin.new(course: @course, admin: @admin)
    assert_not course_admin2.valid?
  end

  test "Pairs can have same course with different admins" do
    @course_admin.save()
    course_admin2 = CourseAdmin.new(course: @course, admin: @admin2)
    assert course_admin2.valid?
  end

  test "Pairs can have same admin with different courses" do
    @course_admin.save()
    course_admin2 = CourseAdmin.new(course: @course2, admin: @admin)
    assert course_admin2.valid?
  end
end
