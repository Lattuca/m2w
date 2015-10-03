class ChangePOnbrInPurchaseOrders < ActiveRecord::Migration
  def change
    change_column :purchase_orders, :po_nbr, :bigint
  end
end
