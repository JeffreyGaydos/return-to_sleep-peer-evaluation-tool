class TeamControllerAdminController < ApplicationController

  # Renders the team_listing page for a specific course as an admin.
  def team_list
    @admin_current_course = "!!! TEMP!!!!"
    # @admin_team_listings - Team...
    # Get an array of all of the teams asssociated with @admin_current_course
    # Display all of them and given options for editing and deleting.
  end

  def team_delete
    # Delete specific team from db.
    # Re-render team_list page.
    team_list
  end

  # Edit a team by going to its view.
  def team_edit

  end

  # Renders the team_create page.
  def team_create

  end

  # Go to here once we clicked the submit/enter button on the team_create page.
  def team_create_submit

  end

  # Renders a spage where we view specific team and give options to edit team, like kicking a student
  def team_view

  end

  # Kicks a student from a team.
  def kick_student_from_team

  end
end
