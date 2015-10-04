
# Function to load POs into an array

def load_po_array
    #puts "ccccccccccccccccccccccccccccccccccccccccccccccccc PO Loading Array"
    @po_array = PurchaseOrder.where("remaining_weight_lbs > ?",100 ).map { |po_array| [po_array.po_nbr, po_array.id] }
end

# Parse out the dates from time_diff
def date_duration_str(date_component)
   #years = date_component[:year]
   #months = date_component[:month]
   #days = date_component[:days]
   #hours = date_component[:hour]
   #minutes = date_component[:minute]
   #date_duration_str = "#{years.to_s}  Yrs #{months.to_s} Mths #{days.to_s}  d #{hours.to_s}:#{minutes.to_s}"
   #date_duration_str = years
 end
