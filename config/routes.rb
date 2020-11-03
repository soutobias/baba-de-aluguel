Rails.application.routes.draw do
  devise_for :views
  devise_for :users
  root to: "pages#home"
  get "filter", to: "pages#filter"
  resources :babysitters do
    resources :services, only: [ :new, :create]
    get "babysitters/:id/services", to: "services#index_babysitters"
  end
  resources :services, only: [ :destroy, :index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
