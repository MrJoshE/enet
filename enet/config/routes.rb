Rails.application.routes.draw do

  get 'contact/create'
  resources :room_messages
  resources :rooms
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'

  resources :university_modules
  resources :rooms
  resources :user_modules, only: [:create, :destroy]

  get 'contact' => 'contact#index'
  post 'contact/create' => 'contact#create'

  mount ActionCable.server => '/cable'

  get 'about' => 'pages#about'
  get 'unauthorized' => 'pages#unauthorized'

  
  get 'sessions/logout' => 'sessions#logout'
  get 'logged_in' => 'sessions#logged_in'

  get 'dashboard' => 'dashboard#index'


  resources :sessions, only: [:create]

  get 'registrations/select' => 'registrations#select'
  resources :registrations, only: [:create, :index]
end
