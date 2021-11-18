require 'test_helper'

class TeamsUserTest < ActiveSupport::TestCase
  def setup
    @team = Team.new(name: "team1")
    @team2 = Team.new(name: "team2")
    @user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
    @user2 = User.new(name: "Example User2", email: "user2@example.com", password: "foobar", password_confirmation: "foobar")
    @teams_user = TeamsUser.new(team: @team, user: @user)
  end

  test "Base case is valid" do
    assert @teams_user.valid?
  end

  test "No duplicate team-user pairs" do
    @teams_user.save()
    teams_user2 = TeamsUser.new(team: @team, user: @user)
    assert_not teams_user2.valid?
  end

  test "Pairs can have same teams with different users" do
    @teams_user.save()
    teams_user2 = TeamsUser.new(team: @team, user: @user2)
    assert teams_user2.valid?
  end

  test "Pairs can have same user with different teams" do
    @teams_user.save()
    teams_user2 = TeamsUser.new(team: @team2, user: @user)
    assert teams_user2.valid?
  end
end
