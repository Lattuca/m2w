class Trailer < ActiveRecord::Base
  belongs_to :purchaseorder

  validates :trailer_nbr, presence: true, uniqueness: true
  validates :driver_name, presence: true
  validates :bol_nbr, presence: true
  validates_numericality_of :bol_nbr, :greater_than_or_equal_to => 10000000, :less_than_or_equal_to => 10000000000, :message =>  "needs to be between 8-10 digits"
  validates :weight_lbs, presence: true


end
