class ImageProcessingWorker

  include Sidekiq::Worker

  sidekiq_options queue: 'Images'

  def perform(image_id, callback_url)
    image = Image.find(image_id)
    image.apply_effect
    image.save!

    if callback_url
      RequestsController.new.put(callback_url, image: image.to_json)
    end
  end

end
