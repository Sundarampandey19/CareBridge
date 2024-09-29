class DoctorController < ApplicationController
  before_action :authenticate_user!
  before_action :check_doctor

  def dashboard
    # @appointments = Appointment.where(doctor_id: current_user.id).where.not(status: :completed)
  end

  def new_page
    # Any logic you need for the page can go here
    @appointments = Appointment.where(doctor_id: current_user.id).where.not(status: :completed)

  end

  private

  def check_doctor
    unless current_user.doctor?
      redirect_to root_path, alert: "You are not authorized to access this dashboard."
    end
  end
end