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
      end
      resources :merchants, except: [:new, :edit]

      resources :transactions, except: [:new, :edit]
    end
  end
end
