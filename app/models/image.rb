class Image < Base

  include Mongoid::Document

  field :effect

  validates :effect, inclusion: { in: %w(negate) }
  validate :check_image

  mount_uploader :picture, ImageUploader

  def apply_effect
    picture.manipulate! do |img|
      img.send(effect.to_sym)
    end
  end

  private
    def check_image
      if picture.url.nil?
        errors.add(:picture, 'invalid image url')
      end
    end
end