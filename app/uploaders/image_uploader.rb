class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :file

  version :small do
    process resize_to_fill: [15, 15]
  end

  version :big do
    process resize_to_fill: [500, 500]
  end

  def move_to_cache
    true
  end

  def move_to_store
    true
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{model.id}/#{mounted_as}"
  end

  def cache_dir
    "tmp/#{model.class.to_s.underscore}/#{model.id}/#{mounted_as}"
  end

end