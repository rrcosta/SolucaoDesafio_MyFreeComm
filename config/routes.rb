Rails.application.routes.draw do
  resources :revenues
  resources :merchants
  resources :purchasers
  resources :items

  resources :example_inputs do
    collection do
      post :import
    end
  end

  root 'example_inputs#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
