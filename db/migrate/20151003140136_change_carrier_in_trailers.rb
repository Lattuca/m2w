class ChangeCarrierInTrailers < ActiveRecord::Migration
  def change
    rename_column :trailers, :carrier_name, :carrier_id
  end
end
