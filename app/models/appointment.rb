class Appointment < ApplicationRecord
  belongs_to :patient, class_name: 'User' # Use the User model for the patient association
  belongs_to :doctor, class_name: 'User'  # Use the User model for the doctor association
end
