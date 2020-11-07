Rails.application.routes.draw do
  resources :items, only: :index
  #get 'items', to: 'items#index'
end
