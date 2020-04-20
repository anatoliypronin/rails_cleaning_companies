Rails.application.routes.draw do
 root to: 'welcome#index'

 namespace :admin do
    root 'welcome#index'
    resources :admins
    
 end  
end
