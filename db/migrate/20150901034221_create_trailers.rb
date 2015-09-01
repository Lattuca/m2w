class CreateTrailers < ActiveRecord::Migration
  def change
    create_table :trailers do |t|
      t.string :trailer_nbr
      t.string :driver_name
      t.integer :carrier_name
      t.date :date_shipped
      t.integer :bol_nbr
      t.date :time_in
      t.date :time_out
      t.string :time_taken_number
      t.string :railcar_nbr
      t.string :worker
      t.integer :weight_lbs
      t.integer :weight_tons
      t.references :purchaseorder, index: true, foreign_key: true
      t.string :added_by
      t.string :changed_by

      t.timestamps null: false
    end
  end
end
