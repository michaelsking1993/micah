Rails.application.routes.draw do
  get 'progress_entries/new'

  get 'progress_entries/create'

  get 'progress_entries/update'

  get 'progress_entries/edit'

  get 'progress_entries/destroy'

  root 'static_pages#splash'
  get 'visualizer', to: 'static_pages#visualizer'
  resources :sessions, only: [:new, :create, :destroy]

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  resources :users
  resources :status_updates
  resources :notes
  resources :steps
  patch '/check_step', to: 'steps#check_step', as: 'check_step'
  resources :features

  resources :projects

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
