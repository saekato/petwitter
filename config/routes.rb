Rails.application.routes.draw do
  resources :articles
  get 'users/show' =>'users#show'
  get 'users', to: 'users#index'
    devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }
  
  # マイページのルーティング
  # get 'users/:id/profile', to: 'users#show', as: 'user_profile'
  # トップページのルーティング
  root to: 'home#index'
end

  