C4belts::Application.routes.draw do

  get "users/index"
  #blog
  get 'blog', to: 'blog#index', as: 'blogs'
  get 'blog/posts/show', to: 'blog#post_1', as: 'blog'

  #causes
  get 'causes', to: 'causes#index', as: 'causes'
  get 'causes/show', to: 'causes#show', as: 'cause'

  #pages
  get 'about', to: 'pages#about', as: 'about'
  get 'celebrities', to: 'pages#celebrities', as: 'celebrities'
  get 'retailers-and-partners', to: 'pages#retailer', as: 'retailers'

  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users

  #admin
  namespace :admin do
    resources :users
    root to: 'dashboard#index'
  end

  root :to => "home#index"
end