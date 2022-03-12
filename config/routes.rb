Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "pages/index"
  root to: "pages#index"

  get '/addresses', to: 'addresses#index'
  get '/addresses/new', to: 'addresses#new'
  get '/addresses/:id', to: 'addresses#show', as: "address"
  post '/addresses', to: 'addresses#create'

end
