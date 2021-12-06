require 'test_helper'

class TeamsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  setup do
    @course = Course.new(class_number: 3901, name:'web dev')
    @team = Team.new(name: 'team name', course: @course)
    @user = User.new(name: 'Example User', email: 'user@example.com', password: 'foobar', password_confirmation: 'foobar')
    @user.save
    @institution = Institution.new(name_id: 'OSU')
    @institution.save
    @admin = Admin.new(user: @user, user_id: 1, institution: @institution, institution_id: 1)

    @team.users << @user
    @team.course = @course

    @course.save
    @team.save
    @user.save

    # Need this to login.
    get '/login'
    assert_template 'login/init'
    post '/login', params: { session: { email: 'user@example.com', password: 'foobar' } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert session[:user_id]
  end


  test 'should get index' do
    get teams_url
    assert_response :success
  end

  test 'should get new' do
    get new_team_url
    assert_response :success
  end

  test 'should show team' do
    get team_url(@team)
    assert_response :success
  end

  test 'should get edit' do
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

  test 'should update team' do
    @admin_rights = true
    patch team_url(@team), params: { team: { name: 'name', course_id: @course.id } }
    assert_redirected_to team_url(@team)
  end

  test 'should not update team given bad params' do
    @admin_rights = true
    patch team_url(@team), params: { team: { name: '', course_id: 1} }
    assert_select 'div', class: 'alert-danger'
  end

  test 'should not update team given bad id' do
    @admin_rights = true
    patch team_url(@team), params: { team: { name: 'name', course_id: 59} }
    assert_select 'div', class: 'alert-danger'
  end

end
