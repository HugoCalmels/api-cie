Rails.application.routes.draw do

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
    get "paysage-latest", to: "paysage_temp_images#latest"
    get "getAllPaysages", to: "paysages#getAllPaysages"

    get "home-latest", to: "home_temp_images#latest"
    resources :types
    resources :home_temp_images
    resources :homes
    resources :dessin_temp_images
    resources :dessin_categories do 
      resources :dessins do 
      end
    end
    resources :paysage_temp_images
    resources :paysage_categories do 
      resources :paysages do 
      end
    end
  end
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
