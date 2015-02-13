Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}
  
  resources :users, only: [:show, :update]
  resources :workplaces
  resources :user_workplaces, only: [:create, :update, :destroy]
  
  post 'workplaces' => 'workplaces#create'
  
  authenticated :user do
    root to: 'users#show', as: 'authenticated_root'
  end
  
  root to: 'welcome#index'
end
