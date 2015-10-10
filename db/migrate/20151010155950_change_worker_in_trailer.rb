class ChangeWorkerInTrailer < ActiveRecord::Migration
  def change
    add_column :trailers, :badge_nbr, :integer
    remove_column :trailers, :worker
  end
end
