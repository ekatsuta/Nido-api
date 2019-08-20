Rails.application.routes.draw do
  resources :messages
  resources :conversations
  resources :language_cases
  resources :language_listings
  resources :languages
  resources :listing_provisions
  resources :provisions
  resources :pictures
  resources :placements
  resources :listings
  resources :cases
  resources :users

  post '/signup', to: 'users#create'
  post '/login', to: "auth#login"
  post '/newlisting', to: "listings#create"
  post '/newcase', to: "cases#create"
  get '/user_listings/:id', to: "users#loadListingsorCases"
  post '/requestPlacement', to: "placements#create"
  patch '/checked/:id', to: "placements#check"
  patch '/readMessage/:id', to: "conversations#readMessage"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
