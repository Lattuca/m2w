json.array!(@trailers) do |trailer|
  json.extract! trailer, :id, :trailer_nbr, :driver_name, :carrier_name, :date_shipped, :bol_nbr, :time_in, :time_out, :time_taken_number, :railcar_nbr, :worker, :weight_lbs, :weight_tons, :purchaseorder_id, :added_by, :changed_by
  json.url trailer_url(trailer, format: :json)
end
