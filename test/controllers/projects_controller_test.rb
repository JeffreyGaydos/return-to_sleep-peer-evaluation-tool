require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  #
  setup do
    @course = Course.new(class_number: 3901, name:'web dev')
    @team = Team.new(name: 'team name', course: @course)
    @user = User.new(name: 'Example User', email: 'user@example.com', password: 'foobar', password_confirmation: 'foobar')
    @user.save
    @institution = Institution.new(name_id: 'OSU')
    @institution.save
    @admin = Admin.new(user: @user, user_id: 1, institution: @institution, institution_id: 1)
    @project = Project.new(name: 'Project!')

    @team.users << @user
    @team.course = @course
    @project.team = @team


    @course.save
    @team.save
    @user.save
    @project.save

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
    get team_projects_url(@team)
    assert_response :success
  end

  test 'should get new' do
    # get new_micropost_url
    get new_team_project_url(@team)
    assert_response :success
  end

  test 'should get edit' do
    # get new_micropost_url
    get edit_team_project_url(@team,@project)
    assert_response :success
  end

  test 'should get show' do
    # get new_micropost_url
    get team_project_path(@team,@project)
    assert_response :success
  end

  test 'should update project' do
    # @admin_rights = true
    patch team_project_url(@project), params: { project: { name: 'name' }}
    assert_redirected_to team_projects_path(team_id: @project.team.id) + "/" + @project.id.to_s
  end

  test 'should not update team given empty name' do
    patch team_project_url(@project), params: { project: { name: '' }}
    assert_select 'div', class: 'alert-danger'
  end

  test 'should not update team given long name' do
    patch team_project_url(@project), params: { project: { name: 'adsfasdf' * 420}}
    assert_select 'div', class: 'alert-danger'
  end


  test "should destroy project" do
    assert_difference('Project.count', -1) do
      delete team_project_url(@team, @project)
    end

    assert_redirected_to team_projects_url
  end

end
