Rails.application.routes.draw do
  root to: 'static#index'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get '/logout',  to: 'sessions#destroy'
  delete '/logout',  to: 'sessions#destroy'
  get '/api' => redirect('/swagger/dist/index.html?url=/api-docs.json')
  get    '/feed',   to: 'static#feed'

  resources :user_data
  resources :clients
  resources :shoes
  resources :malfunctions
  resources :reservations
  resources :price_lists
  resources :tracks
  resources :employees
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.

  # Defines the root path route ("/")
  # root "articles#index"
end
