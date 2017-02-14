class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.integer :patient_id
      t.datetime :appointment_time

      t.timestamps null: false
    end
  end
end
