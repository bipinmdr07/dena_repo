class Event < ActiveRecord::Base
  mount_uploader :featured_image, AvatarUploader

  validates :title, :overview, :signup_link, :datetime, :venue, presence: true

  scope :upcoming, -> { where("datetime >= ?", DateTime.now) }
  scope :past, -> { where("datetime < ?", DateTime.now) }
end
