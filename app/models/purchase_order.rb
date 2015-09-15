class PurchaseOrder < ActiveRecord::Base
  belongs_to :vendor

  validates :po_nbr, presence: true
  validates_numericality_of :po_nbr, :greater_than_or_equal_to => 10000000, :less_than_or_equal_to => 10000000000, :message =>  "needs to be between 8-10 digits"
end
