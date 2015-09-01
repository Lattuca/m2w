json.array!(@carriers) do |carrier|
  json.extract! carrier, :id, :carrier_name, :address_line_1, :address_line_2, :city_name, :state_code, :zip_code, :contact_name1, :email1, :phone_nbr1, :contact_name2, :email2, :phone_nbr2, :comments, :added_by, :changed_by
  json.url carrier_url(carrier, format: :json)
end
