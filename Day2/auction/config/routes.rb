Rails.application.routes.draw do

  devise_for :users
  get '/' => 'site#home'
  get 'profile', to: 'users#profile'



  resources :users do
    resources :products
  end

  resources :users do
      resources :bids
  end

  resources :products do
      resources :bids
      resources :reviews
  end



end


