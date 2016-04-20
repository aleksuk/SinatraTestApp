class ImageUploader < CarrierWave::Uploader::Base
  storage :file

  def store_dir
    'uploads/images'
  end

  def filename
    "#{model.id}-#{Date.new}.#{file.extension}"
  end

end