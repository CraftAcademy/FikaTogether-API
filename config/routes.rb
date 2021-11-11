Rails.application.routes.draw do
  mount_devise_token_auth_for 'Admin', at: 'auth'
  namespace :api do
    resources :fikas, only: [:index, :create]
    resources :departments, only: [:index]
  end
end
