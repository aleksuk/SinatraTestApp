json.images(@images) do |image|
  json.id image.id
  json.effect image.effect
  json.url image.picture.url
  json.small image.picture.small.url
  json.big image.picture.big.url
end