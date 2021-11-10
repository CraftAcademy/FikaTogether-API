Rails.application.routes.draw do
  namespace :api do
    resources :fikas, only: [:index, :create]
  end
end
