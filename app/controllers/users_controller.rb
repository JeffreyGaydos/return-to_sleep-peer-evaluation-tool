class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        render(:layout => 'internal.html.erb')
    end
end