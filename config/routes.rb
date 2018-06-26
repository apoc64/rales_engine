Rails.application.routes.draw do


namespace :api do
  namespace :v1 do
<<<<<<< HEAD
    resources :invoices, only: [:index]
    resources :merchants, except: [:new, :edit]
    resources :transactions, except: [:new, :edit]
=======
    get '/invoices/find', to: 'invoices/search#show'
    get '/invoices/find_all', to: 'invoices/search#index'
    resources :invoices, only: [:index, :show]

>>>>>>> 4db41225949e1bd5457a018737996135501834a6
  end
end
end
