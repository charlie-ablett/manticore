Manticore::Application.routes.draw do
  resources :users
  resources :addresses
  resources :cities
  resources :jurisdictions
  resources :countries

  root  'static_pages#home'
  match '/help',    to: 'static_pages#help',    via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'

end
