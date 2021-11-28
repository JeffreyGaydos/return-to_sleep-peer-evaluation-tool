class UsersController < ApplicationController

    def show
        @user = User.find(params[:id])
        render(:layout => 'internal.html.erb')
    end

    def new
        @user = User.new
        render(:layout => 'authentication.html.erb')
    end

    def create
        @user = User.new(user_params)
        if @user.save
            log_in @user
            flash[:success] = "Account Created successfully. Welcome to return to_sleep's Peer Evaluation Tool!"
            render('show', :layout => 'internal.html.erb')
        else
            render('new', :layout => 'authentication.html.erb')
        end
    end

    private
        def user_params
            params.require(:user).permit(:name, :email, :password, :password_confirmation)
        end
end