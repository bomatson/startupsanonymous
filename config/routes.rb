StartupsAnonymous::Application.routes.draw do

  

  ActiveAdmin.routes(self)

  match '/login',  to: 'sessions#new'
  match '/logout',  to: 'sessions#destroy'

  # resources :users, only: :show
  resource :user, only: [:new, :show, :edit, :create, :update]
  get "/users/:id", to: "users#show", as: :profile

  resource :sessions

  resources :timeslots
  resource :schedule, :controller => :schedule
  resources :password_resets


  match '/help', to: 'pages#help'
  match '/about', to: 'pages#about'
  match '/resources', to: 'pages#resources'
  root to: 'pages#home'
end
