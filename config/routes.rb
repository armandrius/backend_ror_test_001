Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  defaults format: :json do
    resources :contents, only: :index
    resources :movies, only: :index
    resources :seasons, only: :index
    resources :purchases, only: :create
    resources :library, only: :index
  end
end
