class Image < BaseModel
  include Mongoid::Document
  # attr_accessor :avatar, :avatar_cache
  field :picture
  mount_uploader :picture, ImageUploader
end