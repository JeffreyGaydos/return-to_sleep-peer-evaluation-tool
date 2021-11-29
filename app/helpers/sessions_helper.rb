module SessionsHelper

    def log_in(user)
        session[:user_id] = user.id
        @user = nil
        user.id
    end

    def current_user
        if session[:user_id]
            @admin_rights = User.find_by(id: session[:user_id])[:admin_id] #strict ordering
            @current_user ||= User.find_by(id: session[:user_id])
        end
    end

    def logged_in?
        !current_user.nil? #yes we are calling the function here, not the variable
    end

    def log_out
        session.delete(:user_id)
        @current_user = nil
        @admin_rights = nil
    end
end