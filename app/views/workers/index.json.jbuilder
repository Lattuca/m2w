json.array!(@workers) do |worker|
  json.extract! worker, :id, :badge_nbr, :effective_date, :active, :first_name, :last_name, :address_line_1, :address_line_2, :city_name, :state_code, :zip_code, :email, :added_by, :changed_by, :comments
  json.url worker_url(worker, format: :json)
end
