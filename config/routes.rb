Rails.application.routes.draw do
  root 'users#new'
  resources :tasks do
  collection do
    post :confirm
  end
end
resources :sessions, only: [:new, :create, :destroy]
resources :users do
  member do
    get :lable
  end
end
end 
