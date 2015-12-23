class SubmissionRepliesController < ApplicationController
	def create
		parent_comment.submission_replies.create(reply_params)
		redirect_to :back
	end

	private

	def parent_comment
		SubmissionComment.find(params[:submission_comment_id])
	end

	def reply_params
		params.require(:submission_reply).permit(:content, :user_id)
	end
end
