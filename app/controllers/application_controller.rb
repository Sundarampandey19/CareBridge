class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :age])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :age])
  end


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
