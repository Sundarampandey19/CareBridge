class Appointment < ApplicationRecord
  belongs_to :patient, class_name: 'User'
  belongs_to :doctor, class_name: 'User'  


  enum status: { pending: 0, completed: 1, canceled: 2 }
  after_initialize :set_default_status, if: :new_record? 

  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  
  private

  def set_default_status
    self.status ||= :pending
  end
end
