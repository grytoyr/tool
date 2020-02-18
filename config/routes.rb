Rails.application.routes.draw do
  resources :items do
    resources :rentals, only: [:new, :create]
  end

  devise_for :users
  root to: 'pages#home'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
