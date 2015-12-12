json.array!(@items) do |item|
  json.extract! item, :id, :name, :description, :x, :y, :hall_id
  json.url item_url(item, format: :json)
end
