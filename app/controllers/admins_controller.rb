class AdminsController < ApplicationController

    def show
        @admin = Admin.find(params[:id])
        render(:layout => 'internal.html.erb')
    end

    def new
        @admin = Admin.new
        render(:layout => 'authentication.html.erb')
    end

    def create
        @admin = Admin.new(admin_params)
        if @admin.save
            flash[:success] = "Account Created successfully. Welcome to return to_sleep's Peer Evaluation Tool!"
            render('show', :layout => 'internal.html.erb')
        else
            render('new', :layout => 'authentication.html.erb')
        end
    end

    private

        def admin_params
            params.require(:institution_id).permit(:institution_id)
        end
end