Rails.application.routes.draw do
 

 namespace :api do
  namespace :v1 do
    resources :company, only: [:index, :show]
  end
 end

 scope module: :web do
   root to: 'welcome#index'

   resource :session, only: [:new, :create, :destroy]

    namespace :admin do
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
  end
end
