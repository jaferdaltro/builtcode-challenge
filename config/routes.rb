Rails.application.routes.draw do
  root 'home#dashboard'
  resources :doctors, except: [:show]
  resources :patients, except: [:show]
end
