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

  resources :teams
  get '/instructor/team_list', to: 'team_controller_admin#team_list'
  get '/instructor/team_create', to: 'team_controller_admin#team_create'
  get '/instructor/team_view', to: 'team_controller_admin#team_view'
  get '/student/team_view', to: 'team_controller_student#team_view'
  get '/student/team_list', to: 'team_controller_student#team_list'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
