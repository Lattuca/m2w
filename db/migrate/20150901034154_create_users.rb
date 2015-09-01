class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :login
      t.string :password_digest
      t.integer :user_role
      t.integer :pwreset
      t.string :added_by
      t.string :changed_by

      t.timestamps null: false
    end
  end
end
