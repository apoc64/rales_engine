Rails.application.routes.draw do


  namespace :api do
    namespace :v1 do
      get '/merchants/find', to: 'merchants/search#show'
      get '/merchants/find_all', to: 'merchants/search#index'
      resources :merchants, except: [:new, :edit]
      resources :transactions, except: [:new, :edit]

      namespace :items do
        get '/find', to: 'search#show'
        get '/find_all', to: 'search#index'
        get '/most_revenue', to: 'revenue#index'
      end
      resources :items, only: [:index, :show]

      namespace :invoices do
        get 'find', to: 'search#show'
        get '/find_all', to: 'search#index'
        get '/:id/items', to: 'items#index'
        get '/:id/transactions', to: 'transactions#index'
        get '/:id/invoice_items', to: 'invoice_items#index'
        get '/:id/customer', to: 'customer#show'
        get '/:id/merchant', to: 'merchant#show'
      end
      resources :invoices, only: [:index, :show]

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
