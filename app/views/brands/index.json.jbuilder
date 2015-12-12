json.array!(@brands) do |brand|
  json.extract! brand, :id, :name, :description, :user_id
  json.url brand_url(brand, format: :json)
end
