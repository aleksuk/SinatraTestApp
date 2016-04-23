class Image < BaseModel

  include Mongoid::Document

  field :effect

  validate :check_image

  mount_uploader :picture, ImageUploader

  private
    def check_image
      if picture.url.nil?
        errors.add(:picture, 'invalid image url')
      end
    end
end