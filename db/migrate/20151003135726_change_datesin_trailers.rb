class ChangeDatesinTrailers < ActiveRecord::Migration
  def change
    change_column :trailers, :time_in, :datetime
    change_column :trailers, :time_out, :datetime
    change_column :trailers, :weight_tons, :decimal, precision: 5, scale: 2
  end
end
