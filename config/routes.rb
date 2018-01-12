Rails.application.routes.draw do
  resources :families
  # get 'families/new', to: 'families#new'
  # post 'families', to: 'families#create'

  root 'families#index'
end
