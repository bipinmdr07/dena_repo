class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  belongs_to :admin_user
  validates :title, :body, presence: true

  mount_uploader :featured_image, AvatarUploader

  def should_generate_new_friendly_id?
    title_changed? || super
  end

end

