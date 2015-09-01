json.array!(@rail_cars) do |rail_car|
  json.extract! rail_car, :id, :railcar_nbr, :wgt_on_arrival, :wgt_at_origin, :sand_grade, :car_empty, :bol_nbr, :vendor_id, :vendor_po_nbr, :email_bol, :purchaseorder_id, :arrival_dt_elk_city, :arrival_dt_400_line, :actual_dep_dt, :arrival_dt_onsite, :bol_arrival_dt, :added_by, :changed_by
  json.url rail_car_url(rail_car, format: :json)
end
