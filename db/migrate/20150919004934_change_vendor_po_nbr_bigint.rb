class ChangeVendorPoNbrBigint < ActiveRecord::Migration
  def change
    change_column :rail_cars, :vendor_po_nbr, :bigint
  end
end
