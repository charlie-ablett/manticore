Manticore::Application.routes.draw do

root  'home#index'
match '/home',    to: 'home#index',           via: 'get'

resources :users
resources :addresses
resources :cities
resources :jurisdictions
resources :countries do
  collection do
      get :current_collection
    end
end

end
