Rails.application.routes.draw do
  mount_devise_token_auth_for 'Admin', at: 'api/auth'
  namespace :api do
    resources :fikas, only: [:index, :create]
    resources :departments, only: [:index]
    resources :participants, only: [:create, :destroy]
  end
end
