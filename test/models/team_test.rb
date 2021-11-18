require 'test_helper'

class TeamTest < ActiveSupport::TestCase

  def setup
    @team = Team.new(name: "team name")
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

  test "Users associated with team must be valid" do
    @team.users
  end

end
