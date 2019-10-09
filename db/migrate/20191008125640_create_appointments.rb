class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.integer :user_id
      t.integer :doctor_id
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
