class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.date :test_date
      t.time :test_time

      t.timestamps null: false
    end
  end
end
