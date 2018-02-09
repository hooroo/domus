Rails.application.routes.draw do
  resources :families
  resources :groups, only: [:new, :create, :index]

  root "families#index"
end
