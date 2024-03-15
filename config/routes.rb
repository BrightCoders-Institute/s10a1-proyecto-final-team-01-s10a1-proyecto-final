Rails.application.routes.draw do
  resources :tests do
    member do
      delete :remove_image
    end
  end
  get 'errors/not_found'
  get 'errors/internal_server_error'

  resources :reservations
  resources :reviews
  resources :details
  resources :accommodations
  resources :comments
  resources :posts
  resources :messages
  root 'home#index'

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :users

  resource :profile do
    member do
      delete :purge_image
    end
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  get '/404', to: 'errors#not_found'
  get '/500', to: 'errors#internal_server_error'
  get '/internal_server_error', to: 'errors#internal_server_error'
end
