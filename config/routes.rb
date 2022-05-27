Rails.application.routes.draw do
  devise_for :users
  # resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  resources :instructors do
    resource :credentials, only: %i[edit update], module: :instructors
  end
  resources :students

  root 'pages#index'
  # root "users#new"
end
