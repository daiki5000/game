Rails.application.routes.draw do
  root to: 'toppages#index'
  
  resources :users, only: [:create, :new]
end
