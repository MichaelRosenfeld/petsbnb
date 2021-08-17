Rails.application.routes.draw do
  get 'bookings/index'
  get 'bookings/show'
  get 'bookings/create'
  get 'bookings/new'
  get 'bookings/save'
  get 'bookings/delete'
  get 'bookings/edit'
  get 'bookings/update'
  root to: 'pages#home'
  resources :users
  devise_for :users
  resources :pets
end
