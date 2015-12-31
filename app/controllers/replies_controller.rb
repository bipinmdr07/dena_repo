class RepliesController < ApplicationController
	def create
		parent_comment.replies.create(reply_params)
		UserMailer.new_reply(Forum.find(params[:forum_id]), parent_comment, User.find(parent_comment.user_id).email).deliver
		UserMailer.new_reply(Forum.find(params[:forum_id]), parent_comment, "techrisecoding@gmail.com").deliver
		redirect_to :back
	end

	private

	def parent_comment
		Comment.find(params[:comment_id])
	end

	def reply_params
		params.require(:reply).permit(:content, :user_id)
	end
end
