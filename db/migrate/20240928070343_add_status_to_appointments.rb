class AddStatusToAppointments < ActiveRecord::Migration[7.2]
  def change
    add_column :appointments, :status, :integer
  end
end
