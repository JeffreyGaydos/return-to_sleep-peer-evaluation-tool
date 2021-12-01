Rails.application.routes.draw do
  root 'home_page#init'
  get '/home', to: 'home_page#init'
  get '/login', to: 'login#init'
  post '/login', to: 'login#create'
  get '/logout', to: 'login#destroy'
  get '/reset_password', to: 'login#reset_password'
  get '/sign_up', to: 'users#new'
  get '/sign_up/instructors', to: 'admins#new_admin'
  post '/sign_up/instructors', to: 'admins#create_admin'
  get '/sign_up/institution_auth', to: 'admins#new'
  post '/sign_up/institution_auth', to: 'admins#create'
  get '/about', to: 'home_page#about'
  resources :users
  resources :admins
  resources :institutions
  get 'delete_account', to: 'users#delete_account'
  delete 'delete_account', to: 'users#delete_confirmed'

  resources :teams

  # For acessing specific users that are part of a team.
  resources :teams do
    resources :teams_user
  end

  # Routes for accessing projects for a team
  resources :teams do
    resources :projects
  end
end
