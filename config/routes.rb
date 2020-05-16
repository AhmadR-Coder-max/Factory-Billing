Rails.application.routes.draw do
  get 'information/all'
  get 'information/order'
  get 'information/calc'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources :orders
  devise_for :users
  authenticated :user do
    root 'orders#index', as: "authenticated_root"
  end
  root 'welcome#index'
  match ':controller(/:action(/:id))', via: [:get, :post]
end