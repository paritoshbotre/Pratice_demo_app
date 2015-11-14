require 'sidekiq/web'
Rails.application.routes.draw do

  resources :movies do 
    collection do 
      get :autocomplete
    end
  end
  devise_for :users

  # You can have the root of your site routed with "root"
  root 'products#index'

  resources 'products' do
    collection do  
      match :import, via: [:get, :post]
    end
  end

  mount Sidekiq::Web, at: '/sidekiq'
end
