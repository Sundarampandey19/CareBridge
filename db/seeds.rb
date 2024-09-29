require 'faker'

# Define the number of patients and appointments to create
NUM_PATIENTS = 20
NUM_APPOINTMENTS = 30

# Calculate the range for the past month
end_date = Date.parse("2024-09-28")
start_date = end_date - 30



# Create specific users
admin = User.create!(
  email: 'admin@example.com',
  password: 'password',
  password_confirmation: 'password',
  role: :admin,
  name: 'Admin User'
)

doctor = User.create!(
  email: 'doctor@example.com',
  password: 'password',
  password_confirmation: 'password',
  role: :doctor,
  name: 'Doctor User',
  age: Faker::Number.between(from: 30, to: 60)
)

patient = User.create!(
  email: 'patient@example.com',
  password: 'password',
  password_confirmation: 'password',
  role: :patient,
  name: 'Patient User',
  age: Faker::Number.between(from: 18, to: 80)
)

receptionist = User.create!(
  email: 'receptionist@example.com',
  password: 'password',
  password_confirmation: 'password',
  role: :receptionist,
  name: 'Receptionist User'
)



# Create patients
patients = []
NUM_PATIENTS.times do
  patients << User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.unique.email,
    age: rand(1..100),
    password: 'password',
    role: :patient,
    created_at: Faker::Date.between(from: start_date, to: end_date),
    updated_at: end_date
  )
end

# Create doctors
doctors = []
NUM_PATIENTS.times do
  doctors << User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.unique.email,
    age: rand(30..70),  # Assuming doctors are older
    password: 'password',
    role: :doctor,
    created_at: Faker::Date.between(from: start_date, to: end_date),
    updated_at: end_date
  )
end

# Create appointments
NUM_APPOINTMENTS.times do
  Appointment.create!(
    patient: patients.sample,
    doctor: doctors.sample,
    price: rand(10..50),  # Random price between 50 and 300
    date: Faker::Date.between(from: start_date, to: end_date),
    time: "#{rand(9..17)}:#{[0, 15, 30, 45].sample}",  # Random time in hours:minutes format
    created_at: Faker::Date.between(from: start_date, to: end_date),
    updated_at: end_date,
    status: :completed,     # Mark as completed
    payment_status: :paid    # Mark as paid
  )
end

puts "#{NUM_APPOINTMENTS} appointments created successfully!"
