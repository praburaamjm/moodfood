json.array!(@restaurants) do |restaurant|
  json.extract! restaurant, :id, :name, :content, :image_url, :location
  json.url restaurant_url(restaurant, format: :json)
end
