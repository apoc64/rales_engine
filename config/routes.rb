Rails.application.routes.draw do

namespace :api do
  namespace :v1 do
    resources :invoices, only: [:index]
    resources :merchants, except: [:new, :edit]
  end
end
end
