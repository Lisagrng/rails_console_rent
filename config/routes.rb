Rails.application.routes.draw do
  get 'reviews/new'
  devise_for :users
  root to: "consoles#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :consoles do
    resources :bookings, only: %i[new create]
    resources :reviews, only: %i[index new create]
  end
  resources :bookings, only: %i[destroy show index]
  resources :reviews, only: %i[show edit update destroy]
  # Defines the root path route ("/")
  # root "articles#index"
end
