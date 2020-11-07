Rails.application.routes.draw do
  resources :items #, only: :index
  #get 'items', to: 'items#index'
  root  'items#index'
end
