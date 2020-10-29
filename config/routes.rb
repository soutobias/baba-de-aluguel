Rails.application.routes.draw do
  devise_for :views
  devise_for :users
  root to: "pages#home"
  get "profile", to: "dashboard#profile"
  resources :babysitters, only: [ :new, :create, :show, :edit, :update, :destroy ] do
    resources :services, only: [ :new, :create ]
  end
  resources :services, only: [ :destroy ]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
