class RailCar < ActiveRecord::Base
  belongs_to :vendor
  belongs_to :purchaseorder

  validates :railcar_nbr, presence: true, uniqueness: true
  validates_numericality_of :bol_nbr, :greater_than_or_equal_to => 10000000, :less_than_or_equal_to => 10000000000, :message =>  "needs to be between 8-10 digits"

 end
