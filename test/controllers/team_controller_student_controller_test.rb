require 'test_helper'

class TeamControllerStudentControllerTest < ActionDispatch::IntegrationTest
  test "should get team_view" do
    get student_team_view_path
    assert_response :success
  end

  test "should get list" do
    get student_team_list_path
    assert_response :success
  end

end
