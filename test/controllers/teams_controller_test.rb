require 'test_helper'

class TeamsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  setup do
    @course = Course.new(class_number: 3901, name:"web dev")
    @team = Team.new(name: "team name", course: @course)
    @user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")

    @team.users << @user
    @team.course = @course

    @course.save
    @team.save
    @user.save
  end


  test "should get index" do
    get teams_url
    assert_response :success
  end

  test "should get new" do
    get new_team_url
    assert_response :success
  end

  test "should show team" do
    get team_url(@team)
    assert_response :success
  end

  test "should get edit" do
    get edit_team_url(@team)
    assert_response :success
  end

  # test "should get edit student view " do
  #   @admin_rights = false
  #   get edit_team_url(@team)
  #   assert_response :success
  #   assert_select "form", false, "This page must contain no forms"
  # end
  #
  # test "should get edit admin view " do
  #   @admin_rights = true
  #   get edit_team_url(@team)
  #   assert_response :success
  #   assert_select "form", true, "This page must contain forms"
  # end

  test "should update team" do
    @admin_rights = true
    patch team_url(@team), params: { team: { name: "name", course_id: @course.id } }
    assert_redirected_to team_url(@team)
  end

  # test "should not update team given bad params" do
  #   @admin_rights = true
  #   patch team_url(@team), params: { team: { name: "", course_id: -69420} }
  #   assert_select "div"
  # end

end
