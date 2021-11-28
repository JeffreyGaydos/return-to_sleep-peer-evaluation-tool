require 'test_helper'

class TeamControllerAdminControllerTest < ActionDispatch::IntegrationTest
  test "should get team_list" do
    get instructor_team_list_path
    assert_response :success
  end

  test "should get team_create" do
    get instructor_team_create_path
    assert_response :success
  end

  test "should get team_view" do
    get instructor_team_view_path
    assert_response :success
  end

end
