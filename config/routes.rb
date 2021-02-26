Rails.application.routes.draw do
  get 'friends/create'
  get 'friends/get'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  
  resources :tweets do
  resources :likes
  end

  post 'tweets/retweet', to: 'tweets#retweet', as: 'retweet'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'tweets/new'
  root to: "tweets#index"
end
