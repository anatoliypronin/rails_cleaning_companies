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
    end

    namespace :client do
      resource :profile, only: %i[show edit update]
      resource :session, only: %i[new create destroy]
    end
  end
end