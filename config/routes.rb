Rails.application.routes.draw do
 root to: 'welcome#index'

 namespace :admin do
    root 'welcome#index'
    resources :admins do
      get 'restore'
    end
 end  
end
