ChipotleApp::Application.routes.draw do

  # Before switching to 'resouces'
  # root 'users#new'

  # get '/users' => 'users#index'
  # get 'sign_up' => 'users#new', as: "sign_up"
  # post '/users' => 'users#create'

  # get '/orders' => 'orders#index'
  # post '/orders' => 'orders#create'
  # get '/orders/new' => 'orders#new'
  # get '/orders/:id/edit' => 'orders#edit', as: :edit_order
  # patch '/orders/:id' => 'orders#update', as: :order
  # delete '/orders/:id' => 'orders#destroy'

  # Swapped out
  # get '/users/new' => 'users#new'
  # get '/orders/:id' => 'orders#show'

  resources :orders, only: [:index, :show, :create, :new, :edit, :update, :destroy]
  resources :users, only: [:index, :create, :new]
  resource :auth, only: [:create]

  get 'sign_in' => 'auths#new', as: 'login'
  delete 'sign_out' => 'auths#destroy', as: 'logout'

  root to: 'orders#index'

end
