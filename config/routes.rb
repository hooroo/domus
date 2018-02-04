Rails.application.routes.draw do
  resources :families, only: %i[index show new create]

  root "families#index"
end
