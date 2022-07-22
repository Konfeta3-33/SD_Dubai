Rails.application.routes.draw do
  namespace :students do
    get 'logbook/show'
  end
  devise_for :users

  resources :instructors do
    resource :credentials, only: %i[edit update], module: :instructors
  end
  resources :students do
    resources :jumps, module: :students
  end

  root 'pages#index'
end
