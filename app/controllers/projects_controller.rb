class ProjectsController < ApplicationController

  def new
    @admin_rights = true #Put here for debugging
    if @admin_rights
      @project = Project.new # Patchwork
      render 'projects/new'
    else
      render 'shared/denied'
    end

  end

  # Called when we click on the submit button. Creates a new team and either saves it to the database
  # or re-renders the view with error messages
  def create
    # Debug statements to see if forms actually sent something.
    # render plain: params[:team].inspect
    @project = Project.new(get_project_params)
    if @project.save
      redirect_to '/teams/' + params[:team_id].to_s + '/projects/' + @project.id.to_s
    else
      render 'projects/new'
      # render 'projects/new'
    end
  end

  # Returns a hash that initalizes a Team object
  private def get_project_params
    hash = params.require(:project).permit(:name)
    return {team_id: params[:team_id], name: hash[:name]}
  end

  # Show a specific project page #
  def show
    @project = Project.find(params[:id])
    @admin_rights = TRUE #Put here for debugging
    # if @admin_rights
    #   render 'team_admin/show'
    # else
    #   render 'team_student/show'
    # end
  end

  # Display listing of all projects for Team who has a team id of :team_id

  def index
    # Get all teams for a user
    # @teams = @current_user.teams.all
    #
    # @projects_for_team = Project.find

    # @teams = @current_user.team.all
    @admin_rights = TRUE #Put here for debugging

    # if @admin_rights
    #   render 'team_admin/index'
    # else
    #   render 'team_student/index'
    # end
  end
end
