json.array!(@buckles) do |buckle|
  json.extract! buckle, :name, :style, :hex_color, :image
  json.url buckle_url(buckle, format: :json)
end
