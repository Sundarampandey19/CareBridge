class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: { admin: 0, receptionist: 1, doctor: 2, patient: 3 }
  
  after_initialize :set_default_role, if: :new_record?

  private

  def set_default_role
    self.role ||= :patient
  end
end
