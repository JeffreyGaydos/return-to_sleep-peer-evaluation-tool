require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  #
  def setup
    @course = Course.new(class_number: 3901, name:"web dev")
    @team = Team.new(name: "team name", course: @course)
    @user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
    @project = Project.new(name: "Project")


    @team.users << @user
    @project.team = @team


    @course.save
    @team.save
    @user.save
    @project.save
  end


  test "Valid project is valid" do
    assert @project.valid?
  end

  test "Project name should have not be empty" do
    @project.name = ""
    assert_not @project.valid?
  end

  test "Project name should have not be too long" do
    @project.name = "askdljf" * 420
    assert_not @project.valid?
  end

  test "project should have valid teams" do
    print(@project.errors.full_messages)
    assert @project.errors.blank?
  end

  test "project needs to have a team" do
    no_teams = Project.new(name: "Project")

    assert no_teams
  end

end
