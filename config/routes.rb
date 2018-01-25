Rails.application.routes.draw do
  resources :families, only: [:index, :show, :new, :create]

  # root "families#index"
end
