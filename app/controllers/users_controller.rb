class UsersController < ApplicationController

    def show
        #Shared locals
        @user = User.find(params[:id])

        #student locals
        @courses = @user.courses
        @teams = @user.teams
        @admins = []
        @courses.each do |course|
            @admins.push(course.admins)
        end
        #@admins is now a collection of lists of admins, organized by class

        #admin locals
        @managed_courses = @user.admin.courses
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

    private
        def user_params
            params.require(:user).permit(:name, :email, :password, :password_confirmation)
        end
end