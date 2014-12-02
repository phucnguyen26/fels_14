Rails.application.routes.draw do

get 'sessions/new'

root "static_pages#home"
get 'help'    => 'static_pages#help'
get 'about'   => 'static_pages#about'
get 'contact' => 'static_pages#contact'
get 'home'    => 'static_pages#home'
get 'signup'  => 'users#new'

get    'login'   => 'sessions#new'
post   'login'   => 'sessions#create'
delete 'logout'  => 'sessions#destroy'

resources :users do
    member do
      get :following, :followers
    end
end


resources :microposts
resources :comments
resources :relationships
resources :account_activations, only: [:edit]
end
