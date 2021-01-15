Rails.application.routes.draw do
  root 'users#new'
  resources :tasks do
  collection do
  #tasks :confirm
  end
end
resources :sessions, only: [:new, :create, :destroy]
resources :users do
end
end
