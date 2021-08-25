Rails.application.routes.draw do
  get 'appointments/new'
  get 'appointments/create'
  get 'appointments/edit'
  get 'appointments/update'
  root 'home#dashboard'
  resources :doctors, except: [:show]
  resources :patients, except: [:show]
end
