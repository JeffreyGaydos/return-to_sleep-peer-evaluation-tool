class ProjectsController < ApplicationController

  # Debugging purposes only!
  def set_as_admin
    @admin_rights = User.find_by(id: session[:user_id])[:admin_id]
  end

  def new
    set_as_admin
    @project = Project.new # Patchwork
  end

  # Called when we click on the submit button. Creates a new team and either saves it to the database
  # or re-renders the view with error messages
  def create
    # Debug statements to see if forms actually sent something.
    # render plain: params[:team].inspect
    @project = Project.new(get_project_params)
    set_as_admin

    if @project.save
      redirect_to "/teams/#{params[:team_id].to_s}/projects/#{@project.id.to_s}"
    else
      render 'projects/new'
    end
  end

  # Returns a hash that initalizes a Team object
  private def get_project_params
    hash = params.require(:project).permit(:name)
    {team_id: params[:team_id], name: hash[:name]}
  end

  # Show a specific project page #
  def show
    @project = Project.find(params[:id])
    @score
    @score_count
    @current_user = current_user
    set_as_admin
  end

  # Display listing of all projects for Team who has a team id of :team_id

  def index
    # Get all teams for a user
    # @teams = @current_user.teams.all
    #
    # @projects_for_team = Project.find

    set_as_admin
    @team = Team.find_by(params[:team_id])

    #Get all projects associated with team
  end

  # EDIT STUF ######

  # Renders the edit page
  def edit
    set_as_admin
    @project = Project.find(params[:id])
  end

  # Gets called when we want to patch
  def update
    @project = Project.find(params[:id])
    set_as_admin

    if @project.update(get_project_params)
      redirect_to "/teams/#{params[:team_id].to_s}/projects/#{@project.id.to_s}"
    else
      render 'projects/edit'
    end
  end

  ######### Destroy/Delete action. Removes the Team member from the db ############

  # Removes team member from database
  def destroy
    @project= Project.find(params[:id])
    @project.destroy

    redirect_to team_projects_path
  end

  # Patch
  def set_needs_eval
    @project= Project.find(params[:id])

    # Set all of the peer evals to be 0.
    unless @project.needs_eval
      @project.peer_evals.each(&:destroy)
    end

    # Toggle needs_eval and save
    @project.needs_eval = !@project.needs_eval
    @project.save

    # Redirect to the correct project page by giving team and project
    team = Team.find(params[:team_id])
    redirect_to team_project_path(team, @project)
  end
end
