class AdminsController < ApplicationController

    @current_user_id

    def show
        @admin = Admin.find(params[:id])
        render(:layout => 'internal.html.erb')
    end

    def new
        @admin = Admin.new
        render('new', :layout => 'authentication.html.erb')
    end

    def create
        @admin = Admin.new(admin_params)
        @name_id = @admin[:institution_id]
        @institution = Institution.find_by(name_id: @name_id)
        if @institution
            @admin = Admin.new(institution_id: @institution[:id], user_id: request.params[:user_id], institution: @institution, user: User.find_by(id: request.params[:user_id]))
            if @admin.save
                flash[:success] = "Admin Account Created successfully. Welcome to return to_sleep's Peer Evaluation Tool!"
                render('show', :layout => 'internal.html.erb')
            else
                render('new', :layout => 'authentication.html.erb')
            end
        else
            @admin = Admin.new
            @admin.errors.add(:institution_id, :invalid, message: "ID '#{@name_id}' unrecognized")
            render('new', :layout => 'authentication.html.erb')
        end
    end

    def new_admin #creating the user for this admin
        @user = User.new
        render(:layout => 'authentication.html.erb')
    end

    def create_admin #creating the user for this admin
        @user = User.new(user_params)
        if @user.save
            redirect_to "/sign_up/institution_auth?user_id=#{@user[:id]}"
        else
            render('new_admin', :layout => 'authentication.html.erb')
        end
    end

    private
        def user_params
            params.require(:user).permit(:name, :email, :password, :password_confirmation)
        end

        def admin_params
            params.require(:admin).permit(:institution_id)
        end
end