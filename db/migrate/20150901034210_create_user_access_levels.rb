class CreateUserAccessLevels < ActiveRecord::Migration
  def change
    create_table :user_access_levels do |t|
      t.string :access_level

      t.timestamps null: false
    end
  end
end
