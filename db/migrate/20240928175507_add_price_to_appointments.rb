class AddPriceToAppointments < ActiveRecord::Migration[7.2]
  def change
    add_column :appointments, :price, :decimal
  end
end
