Rails.application.routes.draw do
  root 'users#new'
  resources :tasks
  resources :users, only: [:new, :create, :show, :edit]
  resources :sessions, only: [:new, :create, :destroy]
  namespace :admin do
  resources :users, only: [:index, :edit, :update, :new, :create, :show, :destroy]


  #resources :tasks do
  #collection do
  #tasks :confirm
  end
end
#resources :sessions, only: [:new, :create, :destroy]
#resources :users do
