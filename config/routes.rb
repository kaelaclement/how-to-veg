Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#home'
  resources :users do
    resources :recipes
    resources :reviews, only: [:index]
  end
  resources :recipes, only: [:index, :show] do
    resources :reviews, only: [:create]
  end
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/auth/facebook/callback', to: 'sessions#create'
end
