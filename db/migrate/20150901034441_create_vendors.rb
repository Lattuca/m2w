class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :vendor_name
      t.string :address_line_1
      t.string :address_line_2
      t.string :city_name
      t.string :state_code
      t.integer :zip_code
      t.string :contact_name1
      t.string :email1
      t.string :phone_nbr1
      t.string :contact_name2
      t.string :email2
      t.string :phone_nbr2
      t.text :comments
      t.string :added_by
      t.string :changed_by

      t.timestamps null: false
    end
  end
end
