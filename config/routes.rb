Rails.application.routes.draw do
  resources :families
  resources :groups

  root "families#index"
end
