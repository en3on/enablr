Rails.application.routes.draw do
  get '/', to: 'static_pages#index', as: 'homepage'

  devise_for :users, skip: %I[sessions registrations]

  devise_scope :user do
    get '/sign_in', to: 'devise/sessions#new', as: 'new_user_session'
    post '/sign_in', to: 'devise/sessions#create', as: 'user_session'
    delete '/sign_out', to: 'devise/sessions#destroy', as: 'destroy_user_session'

    get '/users/cancel', to: 'devise/registrations#cancel', as: 'cancel_user_registration'
    get '/sign_up', to: 'devise/registrations#new', as: 'new_user_registration'
    get '/users/edit', to: 'devise/registrations#edit', as: 'edit_user_registration'
    patch '/users', to: 'devise/registrations#update', as: 'user_registration'
    put '/users', to: 'devise/registrations#update'
    delete '/users', to: 'devise/registrations#destroy'
    post '/users', to: 'devise/registrations#create'
  end

  post '/projects/:project_id/project_enablrs', to: 'project_enablrs#create', as: 'project_enablr'

  get '/users/:id', to: 'users#show', as: 'user_profile'

  get '/projects', to: 'projects#index', as: 'projects'
  post '/projects', to: 'projects#create'
  get '/projects/new', to: 'projects#new', as: 'new_project'
  get '/projects/:id/edit', to: 'projects#edit', as: 'edit_project'
  get '/projects/:id', to: 'projects#show', as: 'project'
  delete '/projects/:id', to: 'projects#destroy'
  patch '/projects/:id', to: 'projects#update'

  root to: 'static_pages#index'
end
