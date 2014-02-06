ChipotleApp::Application.routes.draw do

  # resources :orders

  get '/users' => 'users#index'

  root 'orders#new'
  get '/orders' => 'orders#index'
  post '/orders' => 'orders#create'
  get '/orders/new' => 'orders#new'
  get '/orders/:id/edit' => 'orders#edit', as: :edit_order
  patch '/orders/:id' => 'orders#update', as: :order
  # get '/orders/:id' => 'orders#show'
  delete '/orders/:id' => 'orders#destroy'

end
