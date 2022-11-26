Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    resources :users 
    
    resources :groups

    resources :group_users
    resources :names
    resources :user_names
    resources :origins
    resources :labels
    resources :name_origins
    resources :name_labels
    resources :friend_lists
    resources :friends
    
  end

end
