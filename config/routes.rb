Rails.application.routes.draw do
  root to: "homes#top"
  devise_for :users
  resources :books, only:[:new, :index, :create, :show, :destroy]
  resources :users, only:[:edit, :show, :update, :index]
  get 'about',to:'homes#about', as:'about'
end
