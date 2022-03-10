Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  root to: 'homes#top'
  devise_for :users

  resources :users, only: [:edit, :show, :index, :update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  resources :books, only: [:edit, :show, :index, :new, :create, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resource :book_comments, only: [:create, :destroy]
  end

  get '/search', to: 'searches#search'

  get '/home/about' => 'homes#about', as: 'about'
  patch 'users/:id' => 'users#update', as: 'update_users'
  patch 'books/:id' => 'books#update', as: 'update_books'
end