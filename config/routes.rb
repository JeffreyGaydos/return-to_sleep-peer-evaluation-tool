Rails.application.routes.draw do
  get '/', to: 'home_page#init'
  get 'home_page/init'
end
