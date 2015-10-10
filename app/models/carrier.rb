class Carrier < ActiveRecord::Base
require 'm2w'
has_many :trailers



def self.list_for_select_carrier
   self.all.map do |carrier|
      [carrier.carrier_name, carrier.id]
   end
end


end
