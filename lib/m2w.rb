
# Function to load POs into an array
LBS_TO_TON = 2206.7

def load_po_array
    #puts "ccccccccccccccccccccccccccccccccccccccccccccccccc PO Loading Array"
    @po_array = PurchaseOrder.where("remaining_weight_lbs > ?",100 ).map { |po_array| [po_array.po_nbr, po_array.id] }
end

# Calculate lbs to tons
def cvt_lbs_to_tons(weight_lbs)
  cvt_lbs_to_tons = (weight_lbs/LBS_TO_TON).round(2)
end

#calculate tons to lbs
def cvt_tons_to_lbs(weight_tons)
  cvt_tons_to_lbs = (weight_tons * LBS_TO_TON).round(-2)
end
