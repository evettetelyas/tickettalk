# frozen_string_literal: true

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  as :user do
    get 'login', to: 'devise/sessions#new'
    get 'register', to: 'devise/registrations#new'
    get 'logout', to: 'devise/sessions#destroy'
    post 'users', to: 'devise/sessions#create'
  end

  get '/users/:username', to: 'users#show', as: :user_show
  post '/users/:username/reviews', to: 'users/reviews#create', as: :new_review

  root to: 'welcome#index'

  resources :rooms
  resources :room_messages

  get '/events', to: 'users/events#index', as: :my_events

  get '/profile', to: 'users/dashboard#index'
  post '/interests', to: 'users/interests#create', as: :current_user_interests
  delete '/interests', to: 'users/interests#destroy', as: :destroy_interest
  get '/search', to: 'users/search#index'
end
