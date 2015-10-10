class ChangeBolNbrToBigInt < ActiveRecord::Migration
  def change
    change_column :rail_cars, :bol_nbr, :bigint
    change_column :trailers, :bol_nbr, :bigint
  end
end
