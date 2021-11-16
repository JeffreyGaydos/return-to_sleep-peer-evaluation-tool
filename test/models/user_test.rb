require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
  end

  test "Example should be valid" do
    assert @user.valid?
  end

  test "Name should be present" do
    @user.name = ""
    assert_not @user.valid?
  end

  test "Email should be present" do
    @user.email = ""
    assert_not @user.valid?
  end

  test "Name should not be too long" do
    @user.name = '#' * 256
    assert_not @user.valid?
  end

  test "Email should not be too long" do
    @user.email = '#' * 256
    assert_not @user.valid?
  end

  test "Email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.bar.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} was deemed as invalid"
    end
  end

  test "Email validation shold reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_fo.org user.name@example. foo@bar_baz.com foo@bar+baz.com user@example..com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} was deemed as valid"
    end
  end

  test 'email addresses should be unique' do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test 'email addresses are not case sensitive differentiable' do
    duplicate_user = @user.dup
    @user.email = "jeff13gaydos@gmail.com"
    duplicate_user.email = "Jeff13Gaydos@gmail.com"
    @user.save
    assert_not duplicate_user.valid?
  end

  test 'password should be present (nonblank)' do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test 'password should have a minimum length' do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end
end
