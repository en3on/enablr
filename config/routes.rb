Rails.application.routes.draw do
  resources :projects
  get '/', to: 'static_pages#index', as: 'homepage'

  devise_for :users

  root to: 'static_pages#index'
end
