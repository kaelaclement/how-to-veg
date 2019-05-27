Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'recipes#index'
  resources :users do
    resources :recipes
  end
  resources :recipes, only: [:index, :show] do
    resources :reviews, only: [:create]
  end
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/auth/facebook/callback', to: 'sessions#create'
  get '/users/:user_id/liked_recipes', to: 'users#liked_recipes'
  get '/recipes/:recipe_id/reviews/new', to: 'reviews#new'
end
