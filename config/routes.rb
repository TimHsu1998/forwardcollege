Rails.application.routes.draw do
  devise_for :users, :controllers => {:omniauth_callbacks => "omniauth_callbacks"}

  root  'missions#index'

  resources :missions do
    resources :comments
  end

  namespace :account do
    resources :missions
    resources :users
  end

  namespace :admin do
    resources :missions
    resources :categories
    resources :users
  end

end
