require 'test_helper'

class AdminTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
    @user.save
    @institution = Institution.new(name_id: "OSU")
    @institution.save
    @admin = Admin.new(user: @user, user_id: 1, institution: @institution, institution_id: 1)
  end

  test "base case" do
    assert @admin.valid?
  end

  test "admin must have 1 user" do
    bad_admin = Admin.new(institution_id: 1)
    assert_not bad_admin.valid?
  end

  test "admin must have 1 institution" do
    bad_admin = Admin.new(user_id: 1)
    assert_not bad_admin.valid?
  end

  test "admins cannot share 1 user" do
    @user.save
    @admin.save
    @admin2 = Admin.new(user_id: 1, institution_id: 1)
    assert_not @admin2.valid?
  end
end
