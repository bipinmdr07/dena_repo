class RepliesController < ApplicationController
	def create
		parent_comment.replies.create(reply_params)
	end

	private

	def parent_comment
		Comment.find(params[:comment_id])
	end

	def reply_params
		params.require(:reply).permit(:content, :user_id)
	end
end
