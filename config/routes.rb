Rails.application.routes.draw do
  resources :families, only: [:index, :show, :new, :create, :destroy]

  root "families#index"
end
