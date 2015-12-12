json.array!(@halls) do |hall|
  json.extract! hall, :id, :name, :description, :shop_id
  json.url hall_url(hall, format: :json)
end
