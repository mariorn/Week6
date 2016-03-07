Rails.application.routes.draw do
 

  resources :sandwiches, except: [:new, :edit] do
    resources :ingredients, except: [:new, :edit] do
      post 'add', to: 'sandwiches#add_ingredient'
    end
  end


end
