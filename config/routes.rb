Rails.application.routes.draw do
  resources :tweets do
    resources :likes
  end

  get 'tweets/show'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'tweets/new'
  root to: "tweets#index"
end
