Rails.application.routes.draw do
  namespace :site do
    get 'welcome/index'
  end
  namespace :users_backoffice do
    get 'user_profile/index'
    get 'welcome/index'
    get 'profile', to: 'profile#edit'
    patch 'profile', to: 'profile#update'
  end
  namespace :admins_backoffice do
    get  'welcome/index'
    get 'users_profile/index'
    get 'profile', to: 'profile#edit'
    patch 'profile', to: 'profile#update'

    resources :schedule
    resources :cash_entrance
  end
  devise_for :users
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "users_backoffice/welcome#index"
end
