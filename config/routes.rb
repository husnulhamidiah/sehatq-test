Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :appointments, only: [:create]
  resources :doctors, only: [:index]
  resources :hospitals, only: [:index]
end
