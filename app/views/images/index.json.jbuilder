json.images(@images) do |image|
  json.extract! image,
                :id,
                :picture
end