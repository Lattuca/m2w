class AddPoNbrToPurchaseOrders < ActiveRecord::Migration
  def change
    add_column :purchase_orders, :po_nbr, :integer
  end
end
