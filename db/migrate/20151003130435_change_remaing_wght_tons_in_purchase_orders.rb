class ChangeRemaingWghtTonsInPurchaseOrders < ActiveRecord::Migration
  def change
    change_column :purchase_orders, :remaining_weight_tons, :decimal, precision: 5, scale: 2
  end
end
