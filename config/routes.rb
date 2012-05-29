EmClicks::Application.routes.draw do
  
  root to: 'portfolios#index'
  
  resources :users, only: [ :new, :create, :show ]
  resources :sessions, only: [:new, :create ]
  resources :portfolios
  
  get 'sign_in' => 'sessions#new', as: :sign_in
  get 'sessions' => 'sessions#destroy', as: :sign_out
  
end
