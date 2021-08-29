Rails.application.routes.draw do
  resources :doctors, except: [:show]
  resources :patients, except: [:show]
  resources :appointments, only: [:new, :create]
end
