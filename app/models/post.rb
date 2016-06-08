class Post < ActiveRecord::Base
  belongs_to :admin_user
  validates :title, :body, presence: true

  mount_uploader :featured_image, AvatarUploader
end
