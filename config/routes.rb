Rails.application.routes.draw do








  resources :newsletters

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
    get "carnet-latest", to: "carnet_temp_images#latest"
    get "getAllCarnets", to: "carnets#getAllCarnets"

    get "home-latest", to: "home_temp_images#latest"

    get "photo-latest", to: "photo_temp_images#latest"

    post "send-to-all-guests", to: "newsletters#send_to_all_guests"

    get "quit-newsletter/:token", to: "guests#destroy_by_token"

    resources :guests
    resources :friends 
    get "getLinkFriends/:link", to: "friends#getLink"
    resources :contact_demands
  
    resources :thumbnail_previews
 
    post "getLink", to: "thumbnail_previews#getLink"
    # PERFORMANCES
    get "video-latest", to: "performance_temp_videos#latest"
    resources :performance_temp_videos
    resources :performance_categories
    resources :performances do 
      resources :extra_performance_videos
    end

    # PHOTOS 
    resources :photos
    resources :photo_categories do 
      resources :photos 
    end
    resources :photo_temp_images
    get "getAllPhotos", to: "photos#getAllPhotos"

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
    resources :carnet_temp_images
    resources :carnet_categories do 
      resources :carnets do 
      end
    end
  end
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
