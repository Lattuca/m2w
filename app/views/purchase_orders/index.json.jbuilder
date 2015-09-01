json.array!(@purchase_orders) do |purchase_order|
  json.extract! purchase_order, :id, :required_weight_tons, :required_weight_lbs, :remaining_weight_tons, :remaining_weight_lbs, :vendor_id, :well_name, :sand_grade, :start_date, :active, :added_by, :changed_by
  json.url purchase_order_url(purchase_order, format: :json)
end
