Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}
  
  resources :users, only: [:show, :update]
  resources :workplaces
  resources :user_workplaces, only: [:create, :update, :destroy]
  
  post 'workplaces' => 'workplaces#create'
  
  as :user do
    get '/sign_in' => 'devise/sessions#new'
    get '/sign_up' => 'devise/registrations#new'
  end
  
  authenticated :user do
    root to: 'users#show', as: 'authenticated_root'
  end
  
  root to: 'welcome#index'
end
