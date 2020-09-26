Rails.application.routes.draw do
  root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new' #ログインと会員登録ではアクションが違う
  resources :users, only: [:index, :show, :new, :create] do
    member do
      get :followings
      get :followers
    end
  end
  
  get 'regisration', to: 'books#new'
  post 'regisration', to: 'books#create'
  resources :books, only: [:edit, :create, :update, :destroy] do
    member do
      get :comments
      get :comment_new
      post :comment_create
    end
  end
  
  resources :relationships, only: [:create, :destroy]
end
