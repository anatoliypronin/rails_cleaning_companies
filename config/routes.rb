Rails.application.routes.draw do

 namespace :api do
  namespace :v1 do
    resources :company, only: [:index, :show]
    resources :article, only: :index
    resources :service, only: :index
    resources :service_price, only: :index
  end
 end

 scope module: :web do
   root to: 'welcome#index'

    namespace :admin do
      resource :session, only: [:new, :create, :destroy]
        root 'welcome#index'
        resources :admins do
          put 'restore'
          put 'del'
        end
        resources :companies do
          put 'restore'
          put 'del'
        end
        resources :clients do
          put 'restore'
          put 'del'
        end
        resources :cities
        resources :articles
        resources :services
        resources :service_prices do
          put 'restore'
          put 'del'
          put 'disable'
        end
    end
    namespace :company do
      resource :session, only: [:new, :create, :destroy]
      resource :profile, only: [:show, :edit, :update]
    end
    namespace :client do
      resource :profile, only: %i[show edit update]
      resource :session, only: %i[new create destroy]
      resources :orders, except: :delete
    end
  end
end
