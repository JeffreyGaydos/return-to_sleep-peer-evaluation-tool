class TeamControllerAdminController < ApplicationController
  def team_list
    @admin_current_course = "Insert current course for admin here"
    # @admin_team_listings - Team...
    # Get an array of all of the teams asssociated with @admin_current_course
    # Display all of them and given options for editing and deleting.
  end

  def team_delete
    # Delete specific team from db.
    # Re-render team_list page.
    team_list
  end

  def team_create
  end

  # View specific team.
  def team_view

  end
end
