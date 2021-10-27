Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'

  resources :university_modules

  get 'about' => 'pages#about'
  get 'unauthorized' => 'pages#unauthorized'

  
  get 'sessions/logout' => 'sessions#logout'
  get 'logged_in' => 'sessions#logged_in'

  get 'dashboard' => 'dashboard#index'

  resources :sessions, only: [:create]
  resources :registrations, only: [:create, :index]
end
