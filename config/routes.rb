Rails.application.routes.draw do
  resources :articles
  resources :authors, only: [:new, :create, :show, :index, :update, :edit]
  root 'authors#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
