class Notification < ApplicationRecord
  belongs_to :recipient, class_name: "User"
  belongs_to :actor, class_name: "User"
  belongs_to :notifiable, polymorphic: true

  after_commit -> { NotificationRelayJob.perform_later(self) }

  scope :unread, -> { where(read_at: nil) }
  scope :recent, -> { order("created_at DESC").limit(10) }
end
