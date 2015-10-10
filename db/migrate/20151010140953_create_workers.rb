class CreateWorkers < ActiveRecord::Migration
  def change
    create_table :workers do |t|
      t.integer :badge_nbr
      t.date :effective_date
      t.boolean :active
      t.string :first_name
      t.string :last_name
      t.string :address_line_1
      t.string :address_line_2
      t.string :city_name
      t.string :state_code
      t.integer :zip_code
      t.string :email
      t.string :added_by
      t.string :changed_by
      t.text :comments

      t.timestamps null: false
    end
    add_index :workers, :active
  end
end
