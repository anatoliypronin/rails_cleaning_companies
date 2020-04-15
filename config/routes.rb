Rails.application.routes.draw do
 root to: 'welcome#index'

 namespace :admin do
  resources :admins
 end  
end
