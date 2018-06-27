Rails.application.routes.draw do


  namespace :api do
    namespace :v1 do
      get '/invoices/find', to: 'invoices/search#show'
      get '/invoices/find_all', to: 'invoices/search#index'
      resources :invoices, only: [:index, :show]

      get '/items/find', to: 'items/search#show'
      get '/items/find_all', to: 'items/search#index'
      resources :items, only: [:index, :show]

      namespace :merchants do
        get '/find', to: 'search#show'
        get '/find_all', to: 'search#index'
        get ':merchant_id/items', to: 'items#index'
        get ':merchant_id/invoices', to: 'invoices#index'
        get ':merchant_id/customers_with_pending_invoices', to: 'customers#index'
        get ':merchant_id/favorite_customer', to: 'customers#show'
      end
      resources :merchants, except: [:new, :edit]

      resources :transactions, except: [:new, :edit]
    end
  end
end
