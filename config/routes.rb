C4belts::Application.routes.draw do

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

  root :to => "home#index"
end