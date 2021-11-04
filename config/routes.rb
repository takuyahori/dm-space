Rails.application.routes.draw do
  devise_for :cliants, controllers: {
    sessions:      'cliants/sessions',
    passwords:     'cliants/passwords',
    registrations: 'cliants/registrations'
  }
  devise_for :trainers, controllers: {
    sessions:      'trainers/sessions',
    passwords:     'trainers/passwords',
    registrations: 'trainers/registrations'
  }
  root to: 'tops#index'
  resources :posts, only: [:new, :create]
end
