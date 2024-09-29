class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin

  def dashboard
    @user_stats = User.group_by_day(:created_at).count
    @appointment_stats = Appointment.where("created_at >= ?", 30.days.ago)
                                     .group_by_day(:created_at)
                                     .sum(:price) # Adjust 'amount' to your actual field name

    # Combine both datasets into one hash
   
     # Combine both datasets into one hash
  @combined_data = (@user_stats.keys | @appointment_stats.keys).map do |date|
    {
      date: date,
      user_registrations: @user_stats[date] || 0,
      total_money: @appointment_stats[date] || 0
    }
  end 
  end
  private
  def authorize_admin
    redirect_to root_path, alert: "You are not authorized to access this page." unless current_user.admin?
  end
end
