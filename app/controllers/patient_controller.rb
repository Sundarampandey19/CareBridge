class PatientController < ApplicationController
  before_action :authenticate_user!

  def dashboard
    # Existing code for the dashboard
  end

  def appointments
    @appointments = Appointment.where(patient_id: current_user.id)
    @unpaidappointments = Appointment.where(patient_id: current_user.id).where.not(payment_status: :paid)
    @total_unpaid_amount = @unpaidappointments.sum(:price) # Sum of the price of unpaid appointments
  end

  def payment
    @appointments = Appointment.where(patient_id: current_user.id, payment_status: :unpaid)
    @total_amount = @appointments.sum(:price)
  end

  def process_payment
    # Logic to handle payment processing goes here
    # You may want to update the payment_status for each appointment to 'paid'
    @appointments = Appointment.where(patient_id: current_user.id, payment_status: :unpaid)
    
    @appointments.update_all(payment_status: :paid) # Mark all as paid

    redirect_to payment_page_path, notice: 'Payment was successful.'
  end
end
