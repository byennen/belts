C4belts::Application.routes.draw do

  #blog
  get 'blog', to: 'blog#index', as: 'blogs'
  get 'blog/posts/show', to: 'blog#post_1', as: 'blog'

  #causes
  get 'causes', to: 'causes#index', as: 'causes'
  get 'causes/:cause', to: 'causes#show', as:'cause'

  #pages
  get 'about', to: 'pages#about', as: 'about'
  get 'celebrities', to: 'pages#celebrities', as: 'celebrities'
  get 'retailers-and-partners', to: 'pages#retailer', as: 'retailers'

  # social feed
  get 'social-feed', to: 'home#social', as: 'social'

  devise_for :users, :controllers => {:sessions => "sessions"}
  resources :users
  resources :orders
  resources :line_items
  resources :carts

  #admin
  namespace :admin do
    resources :buckles
    resources :belts
    resources :orders
    resources :users
    root to: 'dashboard#index'
  end

  root :to => "home#index"
end
