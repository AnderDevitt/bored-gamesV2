Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Send back the home page
  get "pages/index"
  root to: "pages#index"
  
  # Send back all addresses to the client for Admin use
  get 'addresses', to: 'addresses#index'
  # Create new addresses
  post 'addresses', to: 'addresses#create'
  get 'addresses/new', to: 'addresses#new'
  # Send back one address to the client
  get 'addresses/:id', to: 'addresses#show', as: 'address'
  # Edit an address
  get 'addresses/:id/edit', to: 'addresses#edit', as: "edit_address"
  patch 'addresses/:id', to: 'addresses#update'
  put 'addresses/:id', to: 'addresses#update'
  
  get '/mypurchases', to: 'purchases#index', as: "my_purchases"
  
  # Search for games 
  get '/search', to: 'games#search'
  resources :games do
    resources :purchases, only:[:new, :create, :index]
  end

end

