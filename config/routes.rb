Rails.application.routes.draw do
  resources :families, only: %i[index new create]

  root "families#index"
end
