Rails.application.routes.draw do
  get '/', to: 'static_pages#index', as: 'homepage'

  devise_for :users

  get '/projects', to: 'projects#index', as: 'projects'
  post '/users/:user_id/projects', to: 'projects#create', as: 'user_projects'
  get '/projects/new', to: 'projects#new', as: 'new_project'
  get '/users/:user_id/projects/:id/edit', to: 'projects#edit', as: 'edit_project'
  get '/users/:user_id/projects/:id', to: 'projects#show', as: 'project'
  delete '/users/:user_id/projects/:id', to: 'projects#destroy'
  patch '/users/:user_id/projects/:id', to: 'projects#update'

  root to: 'static_pages#index'
end
