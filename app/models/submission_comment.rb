class SubmissionComment < ActiveRecord::Base
	belongs_to :submission
	belongs_to :user
	has_many :submission_replies
end
