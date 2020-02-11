class CreateDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deliveries do |t|
      t.text :sequence, array: true

      t.timestamps
    end
  end
end
