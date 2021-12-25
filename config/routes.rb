Rails.application.routes.draw do
  devise_for :cliants, controllers: {
    sessions:      'cliants/sessions',
    passwords:     'cliants/passwords',
    registrations: 'cliants/registrations',
    omniauth_callbacks: 'cliants/omniauth_callbacks'
  }
  
  devise_for :trainers, controllers: {
    sessions:      'trainers/sessions',
    passwords:     'trainers/passwords',
    registrations: 'trainers/registrations' 
  }

  root to: 'posts#index'

  resources :posts do
    resources :comments, only: [:create, :destroy]
    post 'add' => 'likes#create'
    delete '/add' => 'likes#destroy'
  end
  
  resources :cliants, only: [:show]
  resources :trainers, only: [:show]
end
