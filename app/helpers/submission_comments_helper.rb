module SubmissionCommentsHelper
	
	def submission_back_to_lesson
		@submission_comment = SubmissionComment.find(params[:id])
		'/html_css/' + @submission_comment.lesson.to_s
	end

	def submission_comment_owner(comment)
		User.find(comment.user_id).name
	end

	def submission_reply_owner(reply)
		User.find(reply.user_id).name
	end
end
