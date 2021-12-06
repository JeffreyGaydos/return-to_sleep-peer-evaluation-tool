class TeamsController < ApplicationController

  # Debugging purposes only!
  def set_as_admin
    # @admin_rights = true #Put here for debugging
  end

  # Renders the new page
  def new
    set_as_admin
    @team = Team.new if @admin_rights # Fixes an error, patchwork fix
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
      render 'teams/new'
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

    set_as_admin
  end

  # Display listing of teams #

  def index
    # Get all teams for a user
    # @teams = @current_user.teams.all
    #
    @teams = Team.all

    # @teams = @current_user.team.all
    set_as_admin
  end

  # EDIT PAGE #

  # Renders the edit page
  def edit
    set_as_admin
    @team = Team.find(params[:id]) if @admin_rights
  end

  # Gets called when we want to patch
  def update
    @team = Team.find(params[:id])

    if @team.update(get_teams_params)
      redirect_to @team
    else
      @admin_rights = true
      render 'teams/edit'
    end
  end

  ######### Destroy/Delete action. Removes the Team member from the db ############

  # Removes team member from database
  def destroy
    @team = Team.find(params[:id])
    @team.destroy

    redirect_to teams_path
  end

  # Adding students to a team
  def students
    @team = Team.find(params[:id])
    set_as_admin
  end

  # Only update students here
  def students_patch
    @team = Team.find(params[:id])
    @team.users << User.find_by(id: params[:user_id])
    set_as_admin
    render 'teams/students'
  end

  # Only update students here
  def students_delete
    @team = Team.find(params[:id])
    curr_user = User.find_by(id: params[:user_id])
    @team.users.delete(curr_user)
    redirect_to "#{team_path(@team)}/students/"
  end
end
