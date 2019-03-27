Rails.application.routes.draw do
  root 'static_pages#splash'
  get 'visualizer', to: 'static_pages#visualizer'
  resources :sessions, only: [:new, :create, :destroy]

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'team', to: 'projects#team', as: 'team'
  get 'dashboard', to: 'projects#dashboard', as: 'dashboard'
  resources :users
  resources :status_updates
  resources :notes
  resources :steps
  patch '/check_step', to: 'steps#check_step', as: 'check_step'
  resources :tasks

  resources :projects

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
