Rails.application.routes.draw do

  root to: 'pages#home'
  devise_for :users
  resources :pets do
    resources :bookings, only: [:new, :create]
  end
end
