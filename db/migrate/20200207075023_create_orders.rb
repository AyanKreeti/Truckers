class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :name
      t.float :lat
      t.float :lng
      t.string :status

      t.timestamps
    end
  end
end
