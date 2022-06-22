Rails.application.routes.draw do
  namespace :students do
    get 'logbook/show'
  end
  devise_for :users
  # resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  resources :instructors do
    resource :credentials, only: %i[edit update], module: :instructors
  end
  resources :students do
    resource :logbook, module: :students
  end

  root 'pages#index'
  # root "users#new"
end
