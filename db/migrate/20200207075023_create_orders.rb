class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :name, null: false
      t.float :lat, null: false
      t.float :lng, null: false
      t.string :address, null: false
      t.string :status

      t.timestamps
    end
  end
end
