StartupsAnonymous::Application.routes.draw do

  match '/login',  to: 'sessions#new'
  match '/logout',  to: 'sessions#destroy'

  resources :users

  resource :sessions

  resources :timeslots
  resource :schedule, :controller => :schedule


  match '/help', to: 'pages#help'
  match '/about', to: 'pages#about'
  match '/resources', to: 'pages#resources'
  root to: 'pages#home'
end
