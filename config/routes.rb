Rails.application.routes.draw do
  namespace :admin do
    resources :users, only: [:new, :create, :index, :edit, :update, :destroy]
  end

  resources :appointments , only: [:create , :index , :edit ]
  get "patient/dashboard", to: 'patient#dashboard'
  get "doctor/dashboard", to: 'doctor#dashboard'
  get "receptionist/dashboard", to: 'receptionist#dashboard'
  get 'doctor/new_page', to: 'doctor#new_page', as: :doctor_new_page

  get "receptionist/users/new", to: 'receptionist#new_patient', as: :new_patient 
  post "receptionist/users", to: 'receptionist#create_patient', as: :create_patient   

  get "admin/dashboard", to: 'admin#dashboard'
  devise_for :users

  get "patient/appointments", to: 'patient#appointments', as: :patient_appointments
  get "patient/payment", to: 'patient#payment', as: :payment_page
  post "patient/payment/process", to: 'patient#process_payment', as: :process_payment_page

  
  root "home#index"
end
