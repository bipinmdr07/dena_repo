class SubmissionReply < ActiveRecord::Base
	belongs_to :submission_comment

  validates :submission_comment_id, :user_id, :content, presence: true
end
