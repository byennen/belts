C4belts::Application.routes.draw do

  #blog
  #get 'blog', to: 'blog#index', as: 'blogs'
  #get 'blog/posts/show', to: 'blog#post_1', as: 'blog'

  #causes
  get 'causes', to: 'causes#index', as: 'causes'
  get 'causes/:cause', to: 'causes#show', as:'cause'

  #pages
  get 'about', to: 'pages#about', as: 'about'
  #get 'celebrities', to: 'pages#celebrities', as: 'celebrities'
  get 'retailers-and-partners', to: 'pages#retailer', as: 'retailers'

  # social feed
  get 'social-feed', to: 'home#social', as: 'social'

  get 'check-coupon', to: 'coupons#check_coupon'

  devise_for :users, :controllers => {:sessions => "sessions"}
  resources :users
  resources :orders, only: [:new,:create] do
    collection do 
      post 'confirm'      
    end
  end
  resources :line_items
  resources :carts

  #admin
  namespace :admin do
    resources :buckles
    resources :belts
    resources :orders
    resources :users
    resources :coupons
    root to: 'orders#index'
  end

  root :to => "home#index"
end
