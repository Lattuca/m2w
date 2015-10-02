class PurchaseOrder < ActiveRecord::Base
  belongs_to :vendor
  has_many :trailers
  has_many :rail_cars


  validates :po_nbr, :added_by, :changed_by, :vendor_id, presence: true
  validates_numericality_of :po_nbr, :greater_than_or_equal_to => 10000000, :less_than_or_equal_to => 1000000000,
                            :message =>  "needs to be between 8-10 digits"
  validates_numericality_of :required_weight_tons, :less_than => 1000
  validates :po_nbr, uniqueness: true #, :message => "This PO number already exists"
  before_create :calculate_weight_in_lbs

  #convert tons to lbs

  def calculate_weight_in_lbs
    self.required_weight_lbs = (required_weight_tons * 2206.7).round(-1)
  end

  def calculate_remaining_weight_in_lbs
    if remaining_weight_tons != nil
      self.remaining_weight_lbs = (remaining_weight_tons * 2206.7).round(-1)
    else
      self.remaining_weight_lbs =0
    end
  end

def self.list_for_select_po
   self.all.map do |purchase_order|
      [purchase_order.po_nbr, purchase_order.id]
   end
end

end
