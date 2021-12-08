require 'test_helper'

class PeerEvalControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  def setup
    @course = Course.new(class_number: 3901, name:"web dev")
    @team = Team.new(name: "team name", course: @course)
    @user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
    @user2 = User.new(name: "Example User2", email: "user2@example.com", password: "foobar2", password_confirmation: "foobar2")
    @project = Project.new(name: "Project")
    # @peer_eval = PeerEval.new(score: 10, comment: "nice job")

    @team.course = @course
    @team.users << @user
    @team.projects << @project
    @project.team = @team
    @team.users << @user2

    # @peer_eval.user = @user
    # @peer_eval.team = @team
    # @peer_eval.project = @project

    @course.save
    @team.save
    @user.save
    @user2.save
    @project.save
    @base_title = "Peer Evaluation Tool - "
  end

  test "valid peer evaluation should be created" do

    # login as user
    get '/login'
    assert_template 'login/init'
    post '/login', params: { session: { email: "user@example.com", password: "foobar" } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "title", "#{@base_title}Account"
    assert session[:user_id]

    # POST peer eval
    get "/teams/1/projects/1/peer_eval/new?evaluated_user_id=2"
    
    # assert that new user is created
    assert_difference 'PeerEval.count', 1 do
      post "/teams/1/projects/1/peer_eval", params: { peer_eval: {score: 10, comment: "nice work", user_id: 2, team_id: 1, project_id: 1} }
    end

      assert_response :redirect
    follow_redirect!
    assert_response :success
  end

end
