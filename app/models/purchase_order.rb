class PurchaseOrder < ActiveRecord::Base
  belongs_to :vendor

  validates :po_nbr, :added_by, :changed_by, presence: true
  validates_numericality_of :po_nbr, :greater_than_or_equal_to => 10000000, :less_than_or_equal_to => 10000000000, :message =>  "needs to be between 8-10 digits"
  validates_numericality_of :required_weight_tons, :less_than => 1000
  before_create :calculate_weight_in_lbs

  #convert tons to lbs

  def calculate_weight_in_lbs
    self.required_weight_lbs = required_weight_tons * 2206.7
    #self.required_weight_lbs = 99
  end
end
