ChipotleApp::Application.routes.draw do

  # resources :orders

  root 'users#new'

  get '/users' => 'users#index'
  # get '/users/new' => 'users#new'
  get 'sign_up' => 'users#new', as: "sign_up"
  post '/users' => 'users#create'

  get '/orders' => 'orders#index'
  post '/orders' => 'orders#create'
  get '/orders/new' => 'orders#new'
  get '/orders/:id/edit' => 'orders#edit', as: :edit_order
  patch '/orders/:id' => 'orders#update', as: :order
  # get '/orders/:id' => 'orders#show'
  delete '/orders/:id' => 'orders#destroy'

end
