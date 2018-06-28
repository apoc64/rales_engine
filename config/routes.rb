Rails.application.routes.draw do


  namespace :api do
    namespace :v1 do
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
        get '/revenue', to: 'revenue#index'
        get ':merchant_id/items', to: 'items#index'
        get ':merchant_id/invoices', to: 'invoices#index'
        get ':merchant_id/customers_with_pending_invoices', to: 'customers#index'
        get ':merchant_id/favorite_customer', to: 'customers#show'
        get ':id/revenue', to: 'revenue#show'
      end
      resources :merchants, except: [:edit, :new]

      namespace :transactions do
        get ':id/invoice', to: 'invoices#show'
      end
      resources :transactions, except: [:new, :edit]

      namespace :invoice_items do
        get '/find', to: 'search#show'
        get '/find_all', to: 'search#index'
      end
      resources :invoice_items, only: [:index, :show]

      namespace :customers do
        get ':id/invoices', to: 'invoices#index'
        get ':id/transactions', to: 'transactions#index'
      end
    end
  end
end
