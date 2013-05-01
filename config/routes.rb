StartupsAnonymous::Application.routes.draw do
  resources :users, only: [:create]

  resources :schedules

  match '/help', to: 'pages#help'
  match '/about', to: 'pages#about'
  match '/resources', to: 'pages#resources'
  root to: 'pages#home'


end
