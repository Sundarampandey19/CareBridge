class AddPaymentStatusToAppointments < ActiveRecord::Migration[7.2]
  def change
    add_column :appointments, :payment_status, :integer , default: 0
  end
end
