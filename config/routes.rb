Rails.application.routes.draw do
  get 'projects/index'
  get 'projects/show'
  get 'projects/create'
  get 'projects/new'
  get 'projects/edit'
  get 'projects/update'
  get 'projects/destroy'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
