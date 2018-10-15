Rails.application.routes.draw do
  resources :reservations
  resources :spare_keys
  resources :rooms
  resources :packages
  resources :students
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
