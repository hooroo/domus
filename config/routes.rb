Rails.application.routes.draw do
  resources :families, only: [:index, :new, :create]

  root "families#index"
end
