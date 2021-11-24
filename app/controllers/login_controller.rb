class LoginController < ApplicationController
  def init
    render(:layout => 'authentication.html.erb')
  end
end
