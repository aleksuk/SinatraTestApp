class ImageProcessingWorker

  include Sidekiq::Worker

  sidekiq_options queue: 'Images'

  def perform(image_id)
    image = Image.find(image_id)
    image.apply_effect
    image.save!
  end

end