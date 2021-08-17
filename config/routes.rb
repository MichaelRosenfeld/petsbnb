Rails.application.routes.draw do
  get 'bookings/index'
  get 'bookings/show'
  get 'bookings/create'
  get 'bookings/new'
  get 'bookings/save'
  get 'bookings/delete'
  get 'bookings/edit'
  get 'bookings/update'
  devise_for :users
  root to: 'pages#home'
  resources :pets
end
