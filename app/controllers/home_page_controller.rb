class HomePageController < ApplicationController
  def init
    render(:layout => "application.html.erb")
  end

  def about
    render(:layout => "application.html.erb")
  end
end
