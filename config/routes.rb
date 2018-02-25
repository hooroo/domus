Rails.application.routes.draw do
  resources :families
  resources :schools, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :trips, only: [:index, :new, :create, :edit, :update, :destroy]

  root "families#index"
end
