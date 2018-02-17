Rails.application.routes.draw do
  resources :families
  resources :groups, only: [:new, :create, :index, :update, :edit]

  root "families#index"
end
