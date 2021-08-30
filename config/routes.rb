Rails.application.routes.draw do
  root 'home#dashboard'
  get 'search', to: 'home#search'
  
  resources :doctors, except: [:show]
  resources :patients, except: [:show]
  resources :appointments, only: [:new, :create]
end
