Rails.application.routes.draw do
  root 'home_page#init'
  get '/login', to: 'login#init'
  get '/reset_password', to: 'login#reset_password'
  get '/sign_up', to: 'users#new'
  get '/about', to: 'home_page#about'
  resources :users
end
