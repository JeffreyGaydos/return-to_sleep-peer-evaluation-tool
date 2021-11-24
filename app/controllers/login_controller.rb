class LoginController < ApplicationController
  def init
    render(:layout => 'authentication.html.erb')
  end

  def reset_password
    render(:layout => 'authentication.html.erb')
  end
end
