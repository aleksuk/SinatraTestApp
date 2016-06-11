class ImageSerializer < BaseSerializer

  attributes :id, :url, :effect

  def id
    object.id.to_s
  end

  def url
    object.picture.url
  end

end
