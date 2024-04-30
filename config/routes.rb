Rails.application.routes.draw do
  get 'places/list'
  get 'reservations/index'
  get 'google_maps_api/show'
  get '/accommodation_occupation/show/:accommodation_id/:reservation_id', to: 'accommodations_occupation#show'

  resources :accommodations do
    resources :details
    resources :reviews
    member do
      delete :remove_image
    end
  end
  resources :reservations

  resources :posts do
    resources :comments
  end

  resources :messages

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :users
  resources :users_management do
    member do
      delete :remove_image
    end
  end

  resource :profile do
    member do
      delete :purge_image
    end
  end

  root 'home#index'
  get 'errors/not_found'
  get 'errors/internal_server_error'

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  scope :constraints => lambda { |req| '127.0.0.1'.include? req.remote_addr } do
    get '/google_maps_api/show', to: 'google_maps_api#show'
  end

  get '/404', to: 'errors#not_found'
  get '/500', to: 'errors#internal_server_error'
  get '/internal_server_error', to: 'errors#internal_server_error'

  get :chat_rooms, to: 'chat_rooms#index'
  resources :chat_rooms do
    resources :messages
  end
  
end
