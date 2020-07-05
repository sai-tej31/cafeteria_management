Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "home#index"


  resources :menus
  resources :menu_items
  resources :users
  resources :order_items
  resources :orders
  resources :reports

  get "/pending_orders", to: "orders#pending_orders", as: :pending_orders
  get "/customers", to: "users#customers", as: :customers
  get "/clerks", to: "users#clerks", as: :clerks

  get "/about", to: "home#about", as: :about


  get "/signin" => "sessions#new", as: :new_sessions
  post "/signin" => "sessions#create", as: :sessions
  delete "/signout" => "sessions#destroy", as: :destroy_session

end
