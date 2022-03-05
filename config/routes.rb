Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users

  resources :users, only: [:edit, :show, :index, :update]
  resources :books, only: [:edit, :show, :index, :new, :create, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resource :book_comments, only: [:create, :destroy]
  end
  get '/home/about' => 'homes#about', as: 'about'
  patch 'users/:id' => 'users#update', as: 'update_users'
  patch 'books/:id' => 'books#update', as: 'update_books'
end