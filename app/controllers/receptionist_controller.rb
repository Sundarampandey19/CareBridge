# app/controllers/receptionist_controller.rb
class ReceptionistController < ApplicationController
  before_action :authenticate_user!

  def dashboard
    @today_appointments_count = Appointment.where(date: Date.today).count
    @completed_appointments_count = Appointment.where(status: 'completed').count
  end

  def new_patient
    @user = User.new
  end

  def create_patient
    @user = User.new(user_params)
    @user.role = :patient # Set the role to patient

    if @user.save
      redirect_to receptionist_dashboard_path, notice: "Patient was successfully created."
    else
      render :new_patient, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :name, :age) # Adjust permitted params as necessary
  end
end
