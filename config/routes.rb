Rails.application.routes.draw do
  root 'static_pages#splash'

  resources :sessions, only: [:new, :create, :destroy]

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  resources :users
  resources :status_updates
  resources :notes
  resources :steps
  resources :features

  resources :projects

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
