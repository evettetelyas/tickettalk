# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  devise_for :users

  root to: 'welcome#index'
  
  resources :rooms
  resources :room_messages
  
  get "/profile", to: "users/dashboard#index"

  get '/search', to: 'users/search#index'
end
