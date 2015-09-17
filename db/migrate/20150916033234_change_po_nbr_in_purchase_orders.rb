class ChangePoNbrInPurchaseOrders < ActiveRecord::Migration
  def change
    change_column :rail_cars, :wgt_on_arrival, :decimal, precision: 5, scale: 2
  end
end
