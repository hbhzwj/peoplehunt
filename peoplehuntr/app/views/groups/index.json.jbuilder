json.array!(@groups) do |group|
  json.extract! group, :id, :nickname, :name, :location, :event_time, :status, :is_complete
  json.url group_url(group, format: :json)
end
