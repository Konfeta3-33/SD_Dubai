Rails.application.routes.draw do
  namespace :students do
    get 'logbook/show'
  end
  devise_for :users

  resources :instructors do
    resource :credentials, only: %i[edit update], module: :instructors
  end
  resources :students do
    resource :logbook, module: :students
    resources :jumps do
      # resource :category_a, module: :jumps
    end
  end

  root 'pages#index'
end
