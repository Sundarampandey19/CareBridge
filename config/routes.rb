Rails.application.routes.draw do
  resources :appointments
  get "patient/dashboard" , to: 'patient#dashboard'
  get "doctor/dashboard", to: 'doctor#dashboard'
  get "receptionist/dashboard" ,to: 'receptionist#dashboard'
  get "admin/dashboard" , to: 'admin#dashboard'
  devise_for :users

  # Defines the root path route ("/")
  root "home#index"
end
