Rails.application.routes.draw do


  namespace :api do
    namespace :v1 do
      get '/merchants/find', to: 'merchants/search#show'
      get '/merchants/find_all', to: 'merchants/search#index'
      resources :merchants, except: [:new, :edit]
      resources :transactions, except: [:new, :edit]

      get '/items/find', to: 'items/search#show'
      get '/items/find_all', to: 'items/search#index'
      resources :items, only: [:index, :show]

      namespace :invoices do
        get 'find', to: 'search#show'
        get '/find_all', to: 'search#index'
        get '/:merchant_id/items', to: 'items#index'
        get '/:id/transactions', to: 'transactions#index'
        get '/:id/invoice_items', to: 'invoice_items#index'
      end
      resources :invoices, only: [:index, :show]
    end
  end
end
