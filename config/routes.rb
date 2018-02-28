Rails.application.routes.draw do
  scope "(:locale)", locale: /en|it/ do
    resources :active_families, only: [:index]
    resources :all_families, only: [:index]
    resources :families
    resources :inactive_families, only: [:index]
    resources :schools, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :trips do
      resources :trip_families, only: [:index, :new, :create]
    end
    resources :pages, only: [:show]

    root "pages#show"
  end
end
