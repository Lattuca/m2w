class AddDocColumnsToRailCar < ActiveRecord::Migration
  def change
    add_column :rail_cars, :doc_file_name, :string
    add_column :rail_cars, :doc_content_type, :string
    add_column :rail_cars, :doc_file_size, :integer
    add_column :rail_cars, :doc_comment, :text
    add_column :rail_cars, :doc_updated_at, :datetime
  end
end
