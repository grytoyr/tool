Rails.application.routes.draw do
  resources :items do
    resources :rentals, only: [:create]
      member do
        get 'success'
      end
  end
  get '/dashboard', to: 'items#dashboard', as: :dashboard

  resources :rentals, only: [:destroy]

  devise_for :users
  root to: 'pages#home'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
