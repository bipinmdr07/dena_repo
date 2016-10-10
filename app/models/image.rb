class Image < ApplicationRecord
  mount_uploader :photo, ImageUploader
end
