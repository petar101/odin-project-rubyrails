Rails.application.routes.draw do
  devise_for :users
  root "events#index"

  resources :events, only: [ :index, :show, :new, :create ] do
    resources :attendances, only: [ :create, :destroy ]
  end
  resources :users, only: [ :show ]
end
