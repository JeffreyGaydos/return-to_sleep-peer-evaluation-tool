class UsersController < ApplicationController

    def show
        #Shared locals
        @user = User.find(params[:id])

        if @user.admin
            #admin locals
            @managed_courses = @user.admin.courses
            @managed_teams = []
            @co_admins = []
            @project_status = []
            @has_co_admins = false;
            @managed_courses.each do |mcourse|
                @managed_teams.push(mcourse.teams)
                course_admin_list = mcourse.admins.select {|admin| (admin.user_id != @user.id && admin.user)}
                @co_admins.push(course_admin_list)
                if course_admin_list.length > 0
                    @has_co_admins = true;
                end
            end
            #at this point @co_admins has the current admin in it
            #we avoid this issue in the view
            #@managed_teams is now a collection of lists of teams, organized by class

            @managed_teams.each do |mc_teams|
                mc_teams.each do |team|
                    team_p_status = []
                    team.projects.each do |project|
                        if project.needs_eval
                            if project.peer_evals.length == (team.users.select{|user| !user.admin}.length - 1) * team.users.select{|user| !user.admin}.length
                                team_p_status << 1 #denotes all students completed all peer evals
                            else
                                team_p_status << 0 #denotes incomplete peer evals
                            end
                        end
                    end
                    @project_status << team_p_status
                end
            end
            @project_team_index = 0 #dummy variable for use in the view for admin accounts
        else
            #student locals
            @courses = @user.courses
            @teams = @user.teams
            @project_status = [];
            @admins = []
            @courses.each do |course|
                @admins.push(course.admins)
            end
            @teams.each do |team|
                team_p_status = [];
                team.projects.each do |project|
                    if project.needs_eval
                        if project.peer_evals.select{|x| x.user_id == current_user.id}.length == project.team.users.select{|user| !user.admin}.length - 1
                            team_p_status << 1 #denotes completed all peer evals
                        else
                            team_p_status << 0 #denotes incomplete peer evals
                        end
                    end
                end
                @project_status << team_p_status
            end
            #@admins is now a collection of lists of admins, organized by class
        end
        render(:layout => 'internal.html.erb')
    end

    def new
        @user = User.new
        render(:layout => 'authentication.html.erb')
    end

    def create
        @user = User.new(user_params)
        if @user.save
            user_id = log_in @user
            flash[:success] = "Account Created successfully. Welcome to return to_sleep's Peer Evaluation Tool!"
            #render('show', :layout => 'internal.html.erb')
            redirect_to "/users/#{user_id}"
        else
            render('new', :layout => 'authentication.html.erb')
        end
    end

    def delete_account
        render(:layout => 'internal.html.erb')
    end

    def destroy
        if User.find_by(params[:id]).admin
            User.find_by(params[:id]).admin.courses.each do |course|
                CourseAdmin.find_by(admin_id: User.find_by(params[:id]).admin.id, course_id: course.id).destroy
            end
            User.find_by(params[:id]).admin.destroy
        end
        User.find(params[:id].to_i).destroy
        log_out
        flash[:success] = "Your account has been successfully deleted"
        redirect_to "/"
    end

    def edit
        @user = User.find(params[:id])
        render(:layout => 'authentication.html.erb')
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to "/users/#{params[:id]}"
        else
            render('edit', :layout => 'authentication.html.erb')
        end
    end

    private
        def user_params
            params.require(:user).permit(:name, :email, :password, :password_confirmation)
        end
end