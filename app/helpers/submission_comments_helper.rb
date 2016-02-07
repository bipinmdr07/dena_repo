module SubmissionCommentsHelper

	def submission_comment_owner(comment)
		User.find(comment.user_id).name
	end

	def submission_reply_owner(reply)
		User.find(reply.user_id).name
	end
end
