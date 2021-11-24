class HomePageController < ApplicationController
  def init
    render(:layout => "application.html.erb")
  end
end
