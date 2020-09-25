Rails.application.routes.draw do
  root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new' #ログインと会員登録ではアクションが違う
  resources :users, only: [:index, :show, :new, :create]
  
  get 'regisration', to: 'books#new'
  post 'regisration', to: 'books#create'
  resources :books, only: [:show, :edit, :create, :update, :destroy]
end
