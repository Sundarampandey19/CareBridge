# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


require 'faker'

# Define the number of patients to create
NUM_PATIENTS = 20

# Calculate the range for the past month
end_date = Date.parse("2024-09-28")
start_date = end_date - 30

NUM_PATIENTS.times do
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.unique.email,
    age: rand(1..100), # Random age between 1 and 100
    password: 'password', # Set a default password
    role: :patient, # Set the role as patient
    created_at: Faker::Date.between(from: start_date, to: end_date),
    updated_at: end_date # Set updated_at to today's date
  )
end

puts "#{NUM_PATIENTS} patient users created successfully!"