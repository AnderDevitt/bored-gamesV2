Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "pages/index"
  root to: "pages#index"

  get '/addresses', to: 'addresses#index'
  post '/addresses', to: 'addresses#create'
  get '/addresses/new', to: 'addresses#new'
  get '/addresses/:id', to: 'addresses#show', as: "show_address"
  get '/addresses/:id/edit', to: 'addresses#edit', as: "edit_address"
  patch '/addresses/:id', to: 'addresses#update'
  put '/addresses/:id', to: 'addresses#update'
  delete '/addresses/:id', to: 'addresses#destroy'


end

