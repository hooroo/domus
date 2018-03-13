Rails.application.routes.draw do
  get 'all_families/index'

  scope "(:locale)", locale: /en|it/ do
    resources :active_families, only: [:index]
    resources :all_families, only: [:index]
    resources :families
    resources :inactive_families, only: [:index]
    resources :schools, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :trips, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :pages, only: [:show]

    root "pages#show"
  end
end
