class TeamsController < ApplicationController

  # Renders the new page
  def new
    @admin_rights = TRUE #Put here for debugging

    if @admin_rights
      @team = Team.new # Fixes an error, patchwork fix
      render 'team_admin/new'
    else
      render 'shared/denied'
    end
  end

  # Called when we click on the submit button. Creates a new team and either saves it to the database
  # or re-renders the view with error messages
  def create
    # Debug statements to see if forms actually sent something.
    # render plain: params[:team].inspect
    @team = Team.new(get_teams_params)

    if @team.save
      redirect_to @team
    else
      render 'team_admin/new'
    end
  end

  # Returns a hash that initalizes a Team object
  private def get_teams_params
    hash = params.require(:team).permit(:name, :course_id) # Course_id may be the course number.
    # return {:name => hash[:name], :course_id => Course.find_by_class_number(hash[:course_id]).id}
  end

  # /teams/id #

  # Show a specific team page #
  def show
    @team = Team.find(params[:id])

    @admin_rights = TRUE #Put here for debugging
    if @admin_rights
      render 'team_admin/show'
    else
      render 'team_student/show'
    end
  end

  # Display listing of teams #

  def index
    # Get all teams for a user
    # @teams = @current_user.teams.all
    #
    @teams = Team.all

    # @teams = @current_user.team.all
    @admin_rights = TRUE #Put here for debugging
    if @admin_rights
      render 'team_admin/index'
    else
      render 'team_student/index'
    end
  end

  # EDIT PAGE #

  # Renders the edit page
  def edit
    @admin_rights = TRUE #Put here for debugging
    if @admin_rights
      @team = Team.find(params[:id])
      render 'team_admin/edit'
    else
      render 'shared/denied'
    end
  end

  # Gets called when we want to patch
  def update
    @team = Team.find(params[:id])

    if @team.update(get_teams_params)
      redirect_to @team
    else
      render 'team_admin/edit'
    end
  end

  ######### Destroy/Delete action. Removes the Team member from the db ############

  # Removes team member from database
  def destroy
    @team = Team.find(params[:id])
    @team.destroy

    redirect_to teams_path
  end
end
