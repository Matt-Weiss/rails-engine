Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      #Finders
      namespace :merchants do
        get '/find', to: 'search#show'
        get '/find_all', to: 'search#index'
        get '/most_revenue', to: 'most_revenue#index'
        get '/most_items', to: 'most_items#index'
        get '/revenue', to: 'revenue_by_day#index'
      end

      namespace :customers do
        get '/find', to: 'search#show'
        get '/find_all', to: 'search#index'
      end

      namespace :items do
        get '/find', to: 'search#show'
        get '/find_all', to: 'search#index'
      end

      namespace :invoices do
        get '/find', to: 'search#show'
        get '/find_all', to: 'search#index'
      end

      namespace :transactions do
        get '/find', to: 'search#show'
        get '/find_all', to: 'search#index'
      end

      namespace :invoice_items do
        get '/find', to: 'search#show'
        get '/find_all', to: 'search#index'
      end

      #Indexes of Records
      resources :merchants, only: :index
      resources :customers, only: :index
      resources :items, only: :index

      #Relationships
      resources :merchants, only: :show do
        get '/items', to: 'relationships/merchant_item#index'
        get '/invoices', to: 'relationships/merchant_invoice#index'
      end

      resources :customers, :show do
        get '/invoices', to: 'relationships/customer_invoice#index'
        get '/transactions', to: 'relationships/customer_transaction#index'
      end

      resources :items, only: :show do
        get '/invoice_items', to: 'relationships/item_invoice_items#index'
        get '/merchant', to: 'relationships/item_merchant#show'
      end

      resources :invoices, only: [:index, :show]
      resources :transactions, only: [:index, :show]
      resources :invoice_items, only: [:index, :show]
    end
  end
end
