Rails.application.routes.draw do
  get 'tweets/index'
  get 'tweets/new'
  get 'tweets/show'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'tweets/new'
  root to: "tweets#index"
end
