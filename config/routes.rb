Rails.application.routes.draw do
  scope "(:locale)", locale: /en|it/ do
    resources :active_families, only: [:index]
    resources :all_families, only: [:index]
    resources :families
    resources :inactive_families, only: [:index]
    resources :schools, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :trips, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :current_trips, only: [:index]
    resources :past_trips, only: [:index]
    resources :all_trips, only: [:index]
    resources :pages, only: [:show]

    root "pages#show"
  end
end
