json.array!(@restaurantes) do |restaurante|
  json.extract! restaurante, :id
  json.url restaurante_url(restaurante, format: :json)
end
