Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}
  
  resources :users, only: [:show, :update]
  resources :workplaces, only: [:show, :index]
  
  authenticated :user do
    root to: 'users#show', as: 'authenticated_root'
  end
  
  root to: 'welcome#index'
end
