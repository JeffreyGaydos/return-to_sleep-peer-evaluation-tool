require 'test_helper'

class PeerEvalTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @course = Course.new(class_number: 3901, name:"web dev")
    @team = Team.new(name: "team name", course: @course)
    @user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
    @project = Project.new(name: "Project")
    @peer_eval = PeerEval.new(score: 5, comment: "nice job")

    @team.course = @course
    @team.users << @user
    @team.projects << @project
    @project.team = @team

    @peer_eval.user = @user
    @peer_eval.team = @team
    @peer_eval.project = @project


    @course.save
    @team.save
    @user.save
    @project.save
    @peer_eval.save
  end

  test "Peer Eval should not be blank" do
    @peer_eval.comment = ""
    assert_not @peer_eval.valid?
  end

  test "Peer eval score should be between 1 and 10" do
    @peer_eval.score = 55
    assert_not @peer_eval.valid?
  end

end
