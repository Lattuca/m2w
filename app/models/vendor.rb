class Vendor < ActiveRecord::Base
  has_many :purchase_orders

  def self.list_for_select
     self.all.map do |vendor|
        [vendor.vendor_name, vendor.id]
     end
  end
end
