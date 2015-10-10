
# FConstant to convert lbs and tons
LBS_TO_TON = 2206.7

# load po to be assigned that have a remaining weight > 100 lbs and sort by PO #
def load_po_array
    @po_array = PurchaseOrder.where("remaining_weight_lbs > ?",100 ).order(po_nbr: :asc).map { |po_array| [po_array.po_nbr, po_array.id] }
end

# load rail cars that are not empty to for assignment to and sort by Rail Car #
def load_rail_car_array
  @rail_car_array = RailCar.where(car_empty: false).order(railcar_nbr: :asc) .map { |rail_car_array| [rail_car_array.railcar_nbr]}
end

# load carriers into array for select
def load_carrier_array
  @carrier_array = Carrier.all.order(carrier_name: :asc).map { |carrier_array| [carrier_array.carrier_name, carrier_array.id]}
end

# load worders into array for select
def load_worker_array
  @worker_array = Worker.where(active: true).order(last_name: :asc).map { |worker_array| [worker_array.full_name, worker_array.badge_nbr]}
end


# load all the arrays for frop downs on trailer format
def load_all_arrays
  # load arrays for drop down selections
  load_po_array # load POs
  load_rail_car_array # load rails cars
  load_carrier_array # load carriers for drop down select
  load_worker_array # load workers for drop down list
end

# Calculate lbs to tons and round to nearest 10ths
def cvt_lbs_to_tons(weight_lbs)
  cvt_lbs_to_tons = (weight_lbs/LBS_TO_TON).round(2)
end

#calculate tons to lbs with 2 decimal places
def cvt_tons_to_lbs(weight_tons)
  cvt_tons_to_lbs = (weight_tons * LBS_TO_TON).round(-2)
end
