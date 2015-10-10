class AddIndexOnRailCars < ActiveRecord::Migration
  def change
    add_index :rail_cars, :car_empty 
  end
end
