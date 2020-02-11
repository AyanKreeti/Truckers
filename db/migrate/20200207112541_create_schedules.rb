class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.references :truckers, foreign_key: true
      t.references :delivery, foreign_key: true
      t.date :delivery_date

      t.timestamps
    end
  end
end
