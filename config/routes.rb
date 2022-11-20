Rails.application.routes.draw do
  resources :dessin_temp_images
  devise_for :users,
  controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
  }
get '/member-data', to: 'members#show'

namespace :api do 
  namespace :v1 do 
    get "dessin-latest", to: "dessin_temp_images#latest"
    get "getAllDessins", to: "dessins#getAllDessins"

    resources :dessin_temp_images
    resources :dessin_categories do 
      get "paginateMoreDessins/:index", to: "dessin_categories#paginateMoreDessins"
      resources :dessins do 
   
      end
    end
  end
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
