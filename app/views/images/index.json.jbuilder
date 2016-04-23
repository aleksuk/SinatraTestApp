json.images(@images) do |image|
  json.id image.id
  json.effect image.effect
  json.url image.picture.url
end