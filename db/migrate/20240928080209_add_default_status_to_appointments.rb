class AddDefaultStatusToAppointments < ActiveRecord::Migration[7.2]
  def change
    change_column_default :appointments, :status, from: nil, to: 0 
  end
end
