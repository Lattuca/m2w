
# Function to load POs into an array

def load_po_array
    #puts "ccccccccccccccccccccccccccccccccccccccccccccccccc PO Loading Array"
    @po_array = PurchaseOrder.where("remaining_weight_lbs > ?",100 ).map { |po_array| [po_array.po_nbr, po_array.id] }
end
