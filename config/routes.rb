Rails.application.routes.draw do
  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/shoes/most_expensive', to: 'shoes#most_expensive'
  #  get '/shoes', to: 'shoes#index'
  #  get '/shoes/:id', to: 'shoes#show', as: 'shoe'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  resources :users
  resources :shoes, only: [:index, :new, :create]
   resources :brands do 
    resources :shoes, shallow: true 
   end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
