Rails.application.routes.draw do
  get '/login', to: 'login#init'
  get '/', to: 'home_page#init'
end
