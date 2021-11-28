class LoginController < ApplicationController
  def init
    render(:layout => 'authentication.html.erb')
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      #valid credentials:
      log_in user
      redirect_to user
      #render(user, :layout => 'internal.html.erb')
    else
      flash.now[:danger] = "Invalid email & password combination"
      render('init', :layout => 'authentication.html.erb')
    end
  end

  def destroy
    log_out
    log_out
    redirect_to '/'
  end

  def reset_password
    render(:layout => 'authentication.html.erb')
  end
end
