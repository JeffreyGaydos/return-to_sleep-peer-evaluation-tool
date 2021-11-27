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
            #success
        else
            render('new', :layout => 'authentication.html.erb')
        end
    end

    private

        def user_params
            #ensures that the admin attribute cannot be added via a "hack"
            params.require(:user).permit(:name, :email, :password, :password_confirmation)
        end
end