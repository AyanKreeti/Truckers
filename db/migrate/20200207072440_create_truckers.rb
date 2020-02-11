class CreateTruckers < ActiveRecord::Migration[6.0]
  def change
    create_table :truckers do |t|
      t.string :name

      t.timestamps
    end
  end
end
