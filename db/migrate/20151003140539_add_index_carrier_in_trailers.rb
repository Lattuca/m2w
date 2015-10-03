class AddIndexCarrierInTrailers < ActiveRecord::Migration
  def change
    add_reference :trailers, :carriers, index: true
  end
end
