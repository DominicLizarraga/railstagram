Rails.application.routes.draw do
  devise_for :users

  resources :posts do
    resources :likes, only: [:create, :destroy], module: :posts
    resources :comments, only: [:new, :create], module: :posts
  end

  resources :users, only: [:show], param: :username, path: '' do
    resources :posts, only: [:show], module: :users
  end

  root to: 'welcome#index'

end
