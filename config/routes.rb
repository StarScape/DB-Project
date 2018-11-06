Rails.application.routes.draw do
  resources :reservations
  resources :spare_keys
  resources :rooms
  resources :packages
  # resources :students

  root 'home_page#index'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get '/students/search',  to: 'students#search'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
