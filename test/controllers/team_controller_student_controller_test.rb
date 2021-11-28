require 'test_helper'

class TeamControllerStudentControllerTest < ActionDispatch::IntegrationTest
  test "should get view" do
    get team_controller_student_view_url
    assert_response :success
  end

end
