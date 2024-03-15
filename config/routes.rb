Rails.application.routes.draw do
  resources :tests do
    member do
      delete :remove_image
    end
  end

  resources :accommodations do
    resources :details
    member do
      delete :remove_image
    end
  end

  resources :reservations
  resources :reviews
  resources :comments
  resources :posts
  resources :messages
  root 'home#index'

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
