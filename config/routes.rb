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

  get '/users/:id', to: 'users#show', as: 'user_profile'

  resources :projects do
    resources :perks
  end

  resources :charges

  post '/perk_charge/:perk_id', to: 'charges#perk_charge', as: 'perk_charge'

  get '/projects/:project_id/enablrs/:user_id', to: 'project_enablrs#create', as: 'project_enablr'
  post '/projects/:project_id/enablrs/:user_id', to: 'project_enablrs#create' 
  delete '/projects/:project_id/enablrs', to: 'project_enablrs#destroy', as: 'delete_project_enablr'
  get '/enablrs/:id', to: 'project_enablrs#edit', as: 'edit_project_enablr'
  patch '/enablrs/:id', to: 'project_enablrs#update'



  root to: 'static_pages#index'
end
