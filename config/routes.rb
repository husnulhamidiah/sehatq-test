Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [] do
    post 'signup', to: 'users#create', on: :collection
    get 'appointments', on: :member
  end
  resources :appointments, only: [:create]
  resources :doctors, only: [:index] do
    post 'signup', to: 'doctors#create', on: :collection
    get 'appointments', on: :member
  end
  resources :hospitals, only: [:index]
  post 'auth/login', to: 'authentication#authenticate'
end
