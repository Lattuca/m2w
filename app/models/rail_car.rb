class RailCar < ActiveRecord::Base
  belongs_to :purchaseorder
  belongs_to :vendor

  validates :railcar_nbr, presence: true, uniqueness: true
  validates_numericality_of :vendor_po_nbr, :greater_than_or_equal_to => 10000000, :less_than_or_equal_to => 100000000000000, :message =>  "should be Halliburton TO# (10-15 digits)"
  validates_numericality_of :wgt_on_arrival, :less_than => 1000
end
