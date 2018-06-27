Rails.application.routes.draw do


  namespace :api do
    namespace :v1 do
      get '/invoices/find', to: 'invoices/search#show'
      get '/invoices/find_all', to: 'invoices/search#index'
      resources :invoices, only: [:index, :show]

      namespace :items do
        get '/find', to: 'search#show'
        get '/find_all', to: 'search#index'
        get '/most_revenue', to: 'revenue#index'
      end
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

      namespace :invoice_items do
        get '/find', to: 'search#show'
        get '/find_all', to: 'search#index'
      end
      resources :invoice_items, only: [:index, :show]
    end
  end
end
