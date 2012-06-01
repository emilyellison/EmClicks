EmClicks::Application.routes.draw do
  
  root to: 'static_pages#home'
  
  resources :users, only: [ :new, :create, :show ]
  resources :sessions, only: [:new, :create ]
  resources :portfolios
  
  get 'sign_in' => 'sessions#new', as: :sign_in
  get 'sessions' => 'sessions#destroy', as: :sign_out
  
  get 'home' => 'static_pages#home', as: :home
  get 'about' => 'static_pages#about', as: :about
  
end
