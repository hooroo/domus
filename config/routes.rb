Rails.application.routes.draw do
  resources :families, only: [:index, :new, :create, :destroy]

  root "families#index"
end
