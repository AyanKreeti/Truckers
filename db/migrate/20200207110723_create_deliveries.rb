class CreateDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deliveries do |t|
      t.references :schedule, foreign_key: true
      t.references :order, foreign_key: true
      t.integer :sequence
      t.string :status

      t.timestamps
    end

    add_index :deliveries, [:schedule_id, :order_id], unique: true
  end
end
