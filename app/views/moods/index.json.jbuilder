json.array!(@moods) do |mood|
  json.extract! mood, :id, :name, :desc, :image_url, :submoods
  json.url mood_url(mood, format: :json)
end
