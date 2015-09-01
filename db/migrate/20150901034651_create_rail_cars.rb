class CreateRailCars < ActiveRecord::Migration
  def change
    create_table :rail_cars do |t|
      t.string :railcar_nbr
      t.integer :wgt_on_arrival
      t.integer :wgt_at_origin
      t.string :sand_grade
      t.boolean :car_empty
      t.integer :bol_nbr
      t.references :vendor, index: true, foreign_key: true
      t.integer :vendor_po_nbr
      t.boolean :email_bol
      t.references :purchaseorder, index: true, foreign_key: true
      t.date :arrival_dt_elk_city
      t.date :arrival_dt_400_line
      t.date :actual_dep_dt
      t.date :arrival_dt_onsite
      t.date :bol_arrival_dt
      t.string :added_by
      t.string :changed_by

      t.timestamps null: false
    end
  end
end
