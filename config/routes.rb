Rails.application.routes.draw do
  get '/login', to: 'login#init'
  get '/reset_password', to: 'login#reset_password'
  get '/sign_up', to: 'login#sign_up'
  get '/about', to: 'home_page#about'
  root 'home_page#init'
end
