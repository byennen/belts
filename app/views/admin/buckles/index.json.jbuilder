json.array!(@buckles) do |buckle|
  json.extract! buckle, :name, :hex_color, :image
  json.url buckle_url(buckle, format: :json)
end
