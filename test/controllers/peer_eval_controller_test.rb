require 'test_helper'

class PeerEvalControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  def setup
    @course = Course.new(class_number: 3901, name:"web dev")
    @team = Team.new(name: "team name", course: @course)
    @user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
    @project = Project.new(name: "Project")
    # @peer_eval = PeerEval.new(score: 10, comment: "nice job")

    @team.course = @course
    @team.users << @user
    @team.projects << @project
    @project.team = @team

    # @peer_eval.user = @user
    # @peer_eval.team = @team
    # @peer_eval.project = @project

    @course.save
    @team.save
    @user.save
    @project.save
  end

  test "valid peer evaluation should be created" do
    get new_team_project_peer_eval_path
    post "/new/1", params: { peer_eval: {score: 10, comment: "nice work"} }
    assert_response :success
  end

end
