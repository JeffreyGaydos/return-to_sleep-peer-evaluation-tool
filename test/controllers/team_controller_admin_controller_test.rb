require 'test_helper'

class TeamControllerAdminControllerTest < ActionDispatch::IntegrationTest
  test "should get team_list" do
    get team_controller_admin_team_list_url
    assert_response :success
  end

  test "should get team_create" do
    get team_controller_admin_team_create_url
    assert_response :success
  end

end
