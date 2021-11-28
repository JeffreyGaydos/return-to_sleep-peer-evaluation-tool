Rails.application.routes.draw do
  get 'team_controller_admin/team_list'
  get 'team_controller_admin/team_create'
  get 'team_controller_student/view'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
