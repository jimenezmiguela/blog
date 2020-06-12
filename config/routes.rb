Rails.application.routes.draw do
  resources :posts
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
end
