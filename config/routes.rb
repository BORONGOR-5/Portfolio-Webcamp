Rails.application.routes.draw do
  devise_for :admins
  devise_for :members

  namespace :admin do
  	root to: 'top#top'
  
  	resources :members, only:[:index, :show, :edit, :update]
  
  	resources :genres, only: [:index, :create, :edit, :update]
  
  	resources :movies, only: [:index, :create, :edit, :destroy]
  
  	resources :reviews, only: [:index, :edit, :destroy]
  end
  
  scope module: :member do
  	get '/about', to: 'home#about'
  	get '/producer', to: 'home#producer'
  
  	resources :rooms, only: [:show, :create]
  
  	resources :messages, only: [:create]
  
  	resources :notifications, only: [:index]
  	get '/notifications', to: 'notifications#destroy_all'
  
  	resources :relationships, only: [:index, :show, :create, :destroy]
  
  	resources :favorites, only: [:create, :destroy]
  
  	resources :bookmarks, only: [:index, :create, :destroy]
  
  	resources :movies, only: [:index, :show]
  	root 'movies#top'
  	get 'genres/:id/sort', to: 'movies#sort', as: 'genres_sort'
  
  	resources :comments, only: [:new, :create, :destroy]
  
  	resources :reviews, only: [:show, :new, :create, :edit, :update, :destroy]
  	get '/reviews', to: 'reviews#member_index'
  	
  	resources :members, only: [:index, :show, :edit, :update]
  	get '/members/:id/destroy_page', to: 'members#destroy_page'
  	get '/members/:id/leave', to: 'members#leave'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
