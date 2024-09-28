class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :authenticate_user!
  def after_sign_in_path_for(resource)
    case resource.role
    when 'admin'
      admin_dashboard_path
    when 'receptionist'
      receptionist_dashboard_path
    when 'doctor'
      doctor_dashboard_path
    else
      patient_dashboard_path # Default for patients
    end
  end
end
