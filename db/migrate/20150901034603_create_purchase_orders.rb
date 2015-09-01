class CreatePurchaseOrders < ActiveRecord::Migration
  def change
    create_table :purchase_orders do |t|
      t.integer :required_weight_tons
      t.integer :required_weight_lbs
      t.integer :remaining_weight_tons
      t.integer :remaining_weight_lbs
      t.references :vendor, index: true, foreign_key: true
      t.string :well_name
      t.string :sand_grade
      t.date :start_date
      t.boolean :active
      t.string :added_by
      t.string :changed_by

      t.timestamps null: false
    end
  end
end
