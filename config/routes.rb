Rails.application.routes.draw do
  scope "(:locale)", locale: /en|it/ do
    resources :active_families, only: [:index]
    resources :all_families, only: [:index]
    resources :all_trips, only: [:index]
    resources :current_trips, only: [:index]
    resources :families
    resources :inactive_families, only: [:index]
    resources :schools, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :trips, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :pages, only: [:show]
    resources :past_trips, only: [:index]

    root "pages#show"
  end
end
