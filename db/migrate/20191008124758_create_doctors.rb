class CreateDoctors < ActiveRecord::Migration[5.2]
  def change
    create_table :doctors do |t|
      t.integer :user_id
      t.string :name
      t.time :start_at
      t.time :end_at

      t.timestamps
    end
  end
end
