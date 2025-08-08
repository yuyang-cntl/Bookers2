Rails.application.routes.draw do
  root to: 'homes#top'
  get 'home/about',to:'homes#about', as:'about'

  devise_for :users
  resources :books, only:[
    :new, :index, :create, :show, 
    :update,:edit, :destroy
  ]
  resources :users, only:[
    :edit, :show, :update, :index
  ]
end