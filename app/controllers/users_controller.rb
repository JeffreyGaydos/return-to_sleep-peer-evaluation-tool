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

    def delete_confirmed
        log_out
        User.find_by(id: params[:user].to_i).destroy(params[:user].to_i)
    end

    def destroy
        User.find(params[:id]).destroy
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
            render("show", :layout => 'internal.html.erb')
        else
            render('edit', :layout => 'authentication.html.erb')
        end
    end

    private
        def user_params
            params.require(:user).permit(:name, :email, :password, :password_confirmation)
        end
end