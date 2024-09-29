Rails.application.routes.draw do
  namespace :admin do
    resources :users, only: [:new, :create, :index, :edit, :update, :destroy]
  end

  resources :appointments
  get "patient/dashboard", to: 'patient#dashboard'
  get "doctor/dashboard", to: 'doctor#dashboard'
  get "receptionist/dashboard", to: 'receptionist#dashboard'
  get 'doctor/new_page', to: 'doctor#new_page', as: :doctor_new_page
  # Update receptionist routes
  get "receptionist/users/new", to: 'receptionist#new_patient', as: :new_patient # Add this line
  post "receptionist/users", to: 'receptionist#create_patient', as: :create_patient # Add this line

  get "admin/dashboard", to: 'admin#dashboard'
  devise_for :users

  # Defines the root path route ("/")
  root "home#index"
end
