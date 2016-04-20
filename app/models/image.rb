class Image < BaseModel
  include Mongoid::Document

  field :picture
  mount_uploader :picture, ImageUploader
end