Rails.application.routes.draw do
  resources :books, only:[:new, :index, :create, :show]
  devise_for :users
  root to: "homes#top"
end
