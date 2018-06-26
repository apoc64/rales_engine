Rails.application.routes.draw do


  namespace :api do
    namespace :v1 do
      get '/invoices/find', to: 'invoices/search#show'
      get '/invoices/find_all', to: 'invoices/search#index'
      resources :invoices, only: [:index, :show]

      get '/items/find', to: 'items/search#show'
      get '/items/find_all', to: 'items/search#index'
      resources :items, only: [:index, :show]

      get '/merchants/find', to: 'merchants/search#show'
      get '/merchants/find_all', to: 'merchants/search#index'
      resources :merchants, except: [:new, :edit]
      resources :transactions, except: [:new, :edit]
    end
  end
end
