Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'

  resources :university_modules

  get 'about' => 'pages#about'
  get 'unauthorized' => 'pages#unauthorized'

  
  delete 'logout' => 'sessions#logout'
  get 'logged_in' => 'sessions#logged_in'

  resources :sessions, only: [:create]
  resources :registrations, only: [:create]
end
