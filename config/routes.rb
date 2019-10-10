Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :appointments, only: [:create]
  resources :doctors, only: [:index] do
    get 'appointments', on: :member
  end
  resources :hospitals, only: [:index]
end
