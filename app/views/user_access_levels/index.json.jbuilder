json.array!(@user_access_levels) do |user_access_level|
  json.extract! user_access_level, :id, :access_level
  json.url user_access_level_url(user_access_level, format: :json)
end
