class RepliesController < ApplicationController
	def create
		comment = parent_comment.replies.create(reply_params)

		forum = Forum.find(params[:forum_id])
		user = User.find(comment.user_id)

		UserMailer.new_reply(forum, parent_comment, User.find(parent_comment.user_id).email).deliver
		UserMailer.new_reply(forum, parent_comment, "techrisecoding@gmail.com").deliver

		Slack.chat_postMessage(text: 'New reply by ' + user.name + '. View it <' + forum_comment_url(forum, parent_comment) + '|here >.', username: 'TECHRISE Bot', channel: "#forum_questions", icon_emoji: ":smile_cat:")
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
