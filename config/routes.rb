Rails.application.routes.draw do
  get '/login', to: 'login#init'
  get '/reset_password', to: 'login#reset_password'
  get '/', to: 'home_page#init'
  get '/root', as: '/', to: 'home_page#init'
end
