class SubmissionComment < ActiveRecord::Base
	belongs_to :submission
	belongs_to :user
	has_many :submission_replies, dependent: :destroy

  validates :title, :description, :lesson, :user_id, :submission_id, presence: true
end
