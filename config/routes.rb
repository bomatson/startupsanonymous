StartupsAnonymous::Application.routes.draw do

  

  ActiveAdmin.routes(self)

  match '/login',  to: 'sessions#new'
  match '/logout',  to: 'sessions#destroy'

  resources :users

  resource :sessions

  resources :timeslots
  resource :schedule, :controller => :schedule
  resources :password_resets


  match '/help', to: 'pages#help'
  match '/about', to: 'pages#about'
  match '/resources', to: 'pages#resources'
  root to: 'pages#home'
end
