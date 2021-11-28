Rails.application.routes.draw do
  get 'instructor/team_list', to: 'team_controller_admin#team_list'
  get 'instructor/team_create', to: 'team_controller_admin#team_create'
  get 'instructor/team_view', to: 'team_controller_admin#team_view'
  get 'student/team_view', to: 'team_controller_student#team_view'
  get 'student/team_list', to: 'team_controller_student#team_list'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
