Rails.application.routes.draw do
  root 'home_page#init'
  get '/login', to: 'login#init'
  get '/reset_password', to: 'login#reset_password'
  get '/sign_up', to: 'users#new'
  get '/sign_up/instructors', to: 'users#new_admin'
  post '/sign_up/instructors', to: 'users#create_admin'
  get '/about', to: 'home_page#about'
  resources :users
  resources :admins
end
