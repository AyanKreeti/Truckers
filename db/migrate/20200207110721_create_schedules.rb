class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.references :trucker, foreign_key: true
      t.date :delivery_date, null: false
      t.string :schedule_name
      t.string :status
      
      t.timestamps
    end
  end
end
