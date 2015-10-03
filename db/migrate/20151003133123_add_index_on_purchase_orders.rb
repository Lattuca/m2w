class AddIndexOnPurchaseOrders < ActiveRecord::Migration
  def change
    add_index :purchase_orders, :po_nbr, unique: true
    add_index :purchase_orders, :remaining_weight_lbs
  end
end
