Rails.application.routes.draw do
  root 'home_page#index'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get '/students/search',  to: 'students#search'

  get     '/packages/in',        to: 'packages#new'
  post    '/packages/in',        to: 'packages#create'
  get     '/packages/out',       to: 'packages#edit'
  post    '/packages/out',       to: 'packages#update'
  get     '/packages/find',      to: 'packages#find'

  get     '/reservations',        to: 'reservations#index'
  get     '/reservations/find',   to: 'reservations#find'
  post    '/reservations/new',    to: 'reservations#create'
  post    '/reservations/update', to: 'reservations#update'
  delete  '/reservations/delete', to: 'reservations#destroy'
  
  get     '/keys',                to: 'spare_keys#index'
  get     '/keys/find',           to: 'spare_keys#find'
  post    '/keys/update',         to: 'spare_keys#update'
end
