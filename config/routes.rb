Rails.application.routes.draw do
  devise_for :users

  # You can have the root of your site routed with "root"
  root 'products#index'

  resources 'products' do
    collection do  
      match :import, via: [:get, :post]
    end
  end
end
