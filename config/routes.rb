Rails.application.routes.draw do
  devise_for :users
  root to: "consoles#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :consoles do
    resources :bookings, only: %i[new create]
  end
  resources :bookings, only: %i[destroy show index]
  # Defines the root path route ("/")
  # root "articles#index"
end
