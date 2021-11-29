require 'test_helper'

class HomePageControllerTest < ActionDispatch::IntegrationTest
  def setup
    @base_title = "Peer Evaluation Tool - "
  end

  test "should get home page init" do
    get "/"
    assert_response :success
    assert_select "title", "#{@base_title}Home"
  end

  test "should get about" do
    get "/about"
    assert_response :success
    assert_select "title", "#{@base_title}About"
  end

end
