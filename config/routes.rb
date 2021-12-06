Rails.application.routes.draw do
  root 'home_page#init'
  get '/home', to: 'home_page#init'
  get '/login', to: 'login#init'
  post '/login', to: 'login#create'
  get '/logout', to: 'login#destroy'
  get '/sign_up', to: 'users#new'
  get '/sign_up/instructors', to: 'admins#new_admin'
  post '/sign_up/instructors', to: 'admins#create_admin'
  get '/sign_up/institution_auth', to: 'admins#new'
  post '/sign_up/institution_auth', to: 'admins#create'
  get '/about', to: 'home_page#about'
  post '/courses/add', to: 'courses#add'

  resources :users
  resources :admins
  resources :courses
  resources :institutions
  get 'delete_account', to: 'users#delete_account'
  delete 'delete_account', to: 'users#delete_confirmed'

  resources :teams

  # For acessing specific users that are part of a team.
  resources :teams do
    resources :teams_user
  end

  # Route for adding students to a team
  get '/teams/:id/students', to: 'teams#students'
  # POST for adding a new student.
  patch '/teams/:id/students/', to: 'teams#students_patch'
  delete '/teams/:id/students/', to: 'teams#students_delete'

  # Routes for accessing projects for a team
  resources :teams do
    resources :projects
  end

  # resources :teams do
  #   resources :projects do
  #     resources :peer_eval do
  #         get 'teams/:id/projects/:id/peer_eval/:id', to: 'peer_eval#test'
  #       end
  #   end
  # end

  resources :teams do
    resources :projects do
      resources :peer_eval
    end
  end

post '/teams/:team_id/projects/:project_id/peer_eval/new', to: 'peer_eval#create'

end
