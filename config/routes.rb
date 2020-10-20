Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'cocktails#index'

  resources :cocktails do
  	resources :doses, only: [:create]
  end

  resources :doses, only: :destroy

  resources :doses do
  	resources :ingredients, only: [:new, :create]
  end
end
