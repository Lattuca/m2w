class ChangeDatatypeWeightAtOriginForRailCar < ActiveRecord::Migration
  def change
    change_column :rail_cars, :wgt_at_origin, :decimal, precision: 5, scale: 2
  end
end
