Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users

  resources :users, only: [:edit, :show, :create, :index, :update]
  resources :books, only: [:edit, :show, :index, :new, :create, :destroy]
  get '/home/about' => 'homes#about', as: 'about'
  patch 'users/:id' => 'users#update', as: 'update_users'
  patch 'books/:id' => 'books#update', as: 'update_books'
end