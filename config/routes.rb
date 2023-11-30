Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  resources :stars do
    resources :rentals
  end
  get '/dashboard', to: 'pages#dashboard'
  resources :rentals do
    # Use a member route for approve_request
    member do
      patch 'approve_request'
    end
  end
  # Defines the root path route ("/")
  # root "posts#index"
end
