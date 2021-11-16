Rails.application.routes.draw do
  namespace :api do
    get 'participants/create'
  end
  mount_devise_token_auth_for 'Admin', at: 'api/auth'
  namespace :api do
    resources :fikas, only: [:index, :create]
    resources :departments, only: [:index]
  end
end
