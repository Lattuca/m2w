class ChangeDataTypeInPurchaseOrders < ActiveRecord::Migration
  def change
    change_column :purchase_orders, :required_weight_tons, :decimal, precision: 5, scale: 2
  end
end
