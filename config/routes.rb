Manticore::Application.routes.draw do

root  'search#index'

resources :users do
  collection do
    get :results
  end
end
resources :addresses
resources :cities
resources :jurisdictions
resources :countries do
  collection do
      get :current_collection
    end
end

end
