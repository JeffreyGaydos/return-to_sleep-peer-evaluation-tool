require 'test_helper'

class TeamTest < ActiveSupport::TestCase

  def setup
    @course = Course.new(class_number: 3901)
    @team = Team.new(name: "team name", course: @course)
    @user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
  end

  test "Default value for needs_eval if not given needs to be false" do
    assert @team.needs_eval == false
  end

  test "Not given an inital needs_eval value is valid" do
    assert @team.valid?
  end

  test "Initalized needs_eval to be true is valid" do
    Team.new(name: "team name", needs_eval: true).valid?
  end

  test "Initalized needs_eval to be false is valid" do
    Team.new(name: "team name", needs_eval: false).valid?
  end

  test "Team name needs minimum length of 1 ch" do
    @team.name = ""
    assert_not @team.valid?
  end

  test "Team name needs max length of 255 ch" do
    @team.name = "0" * 256
    assert_not @team.valid?
  end

  test "Team does not need to have associated users" do
    assert @team.valid?
  end

  test "Team's users can be valid users" do
    @user.save()
    @team.users << @user
    assert @team.valid?
  end

  test "Team's users cannot be invalid users" do
    user = User.new(name: "Example User", email: "", password: "foobar", password_confirmation: "foobar") #invalid user
    user.save()
    @team.users << user
    assert_not @team.valid?
  end

end
