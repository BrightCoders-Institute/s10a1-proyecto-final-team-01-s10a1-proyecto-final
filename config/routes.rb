Rails.application.routes.draw do
  get 'errors/not_found'
  get 'errors/internal_server_error'
  root 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  get '/404', to: 'errors#not_found'
  get '/500', to: 'errors#internal_server_error'
  get '/internal_server_error', to: 'errors#internal_server_error'
end
