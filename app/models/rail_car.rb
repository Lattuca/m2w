class RailCar < ActiveRecord::Base
  belongs_to :vendor
  belongs_to :purchaseorder
end
