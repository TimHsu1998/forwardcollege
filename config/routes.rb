Rails.application.routes.draw do
  devise_for :users
  root  'missions#index'
  resources :missions do
    resources :comments
  end
  namespace :account do
    resources :missions
  end

end
