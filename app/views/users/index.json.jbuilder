json.array!(@users) do |user|
  json.extract! user, :id, :first_name, :last_name, :login, :user_role, :pwreset, :added_by, :changed_by
  json.url user_url(user, format: :json)
end
