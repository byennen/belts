json.array!(@belts) do |belt|
  json.extract! belt, :name, :hex_color, :image
  json.url belt_url(belt, format: :json)
end
