require 'test_helper'

class HomePageControllerTest < ActionDispatch::IntegrationTest
  test "should get init" do
    get home_page_init_url
    assert_response :success
  end

end
