require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  #
  def setup
    @project = Project.new(name:"Project")
    @team = Team.new(name: "team")
  end


end
