class ChangeDatesOnRailCars < ActiveRecord::Migration
  def change
    change_column :rail_cars, :arrival_dt_elk_city, :datetime
    change_column :rail_cars, :arrival_dt_400_line, :datetime
    change_column :rail_cars, :actual_dep_dt, :datetime
    change_column :rail_cars, :arrival_dt_onsite, :datetime
    change_column :rail_cars, :bol_arrival_dt, :datetime
  end
end
