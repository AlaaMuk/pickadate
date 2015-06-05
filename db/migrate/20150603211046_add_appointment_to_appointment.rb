class AddAppointmentToAppointment < ActiveRecord::Migration
  def change
    add_column :appointments, :test_appointment, :datetime
  end
end
