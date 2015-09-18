class Vendor < ActiveRecord::Base
  has_many :purchase_orders
  has_many :rail_cars
  
  validates_numericality_of :po_nbr, :greater_than_or_equal_to => 10000000, :less_than_or_equal_to => 10000000000, :message =>  "needs to be between 8-10 digits"

  def self.list_for_select
     self.all.map do |vendor|
        [vendor.vendor_name, vendor.id]
     end
  end
end
