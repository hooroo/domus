Rails.application.routes.draw do
  resources :families

  root "families#index"
end
