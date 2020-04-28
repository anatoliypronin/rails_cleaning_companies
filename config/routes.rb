Rails.application.routes.draw do
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
 end  
end
