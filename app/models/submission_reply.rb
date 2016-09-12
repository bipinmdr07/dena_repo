class SubmissionReply < ActiveRecord::Base
	belongs_to :submission
  belongs_to :user

  validates :submission_id, :user_id, :content, presence: true

  delegate :name, to: :user, prefix: true
  delegate :email, to: :user, prefix: true
  delegate :avatar, to: :user, prefix: true
end
