Rails.application.routes.draw do
  devise_for :users
  resources :items #, only: :index
  #get 'items', to: 'items#index'
  #root  'items#index'
  root to: 'items#index'
  #post 'items', to: 'items#new'
  

end
