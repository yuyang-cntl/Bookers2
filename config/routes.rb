Rails.application.routes.draw do
  root to: "homes#top"
  scope '/bookers2' do
  devise_for :users
  resources :books, only:[:new, :index, :create, :show, :update,:edit, :destroy]
  resources :users, only:[:edit, :show, :update, :index]
  get 'about',to:'homes#about', as:'about'
 end
end