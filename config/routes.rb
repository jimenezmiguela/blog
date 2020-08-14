 Rails.application.routes.draw do
  resources :customers
  resources :posts
    resources :comments
  # get /pages path
  get '/pages', to: 'pages#index'  # For details on the DSL available within this file,
  post '/pages', to: 'pages#create'
  get '/pages/new', to: 'pages#new', as: 'new_page'
  get '/pages/:id', to: 'pages#show', as: 'page'
  get '/pages/:id/edit', to: 'pages#edit', as: 'edit_page'
  #update
  patch '/pages/:id', to: 'pages#update'
  #delete
  delete '/pages/:id', to: 'pages#destroy'
  #orders
  get '/orders', to: 'orders#index'
  post '/orders', to: 'orders#create'
  get '/orders/new', to: 'orders#new', as: 'new_order'
  get '/orders/:id', to: 'orders#show', as: 'order'
  get '/orders/:id/edit', to: 'orders#edit', as: 'edit_order'
  #update
  patch '/orders/:id', to: 'orders#update'
  put '/orders/:id', to: 'orders#update'
  #delete
  delete '/orders/:id', to: 'orders#destroy'

end
