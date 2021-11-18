require 'test_helper'

class AdminTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
    @admin = Admin.new(user_id: 1)
  end

  test "admin must have 1 user" do
    bad_admin = Admin.new()
    assert_not bad_admin.valid?
  end

  test "admin must have a user" do
    assert_not @admin.valid?
  end

  test "admins cannot share 1 user" do
    @user.save
    @admin.save
    @admin2 = Admin.new(user_id: 1)
    assert_not @admin2.valid?
  end
end
