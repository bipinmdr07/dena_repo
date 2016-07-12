class SubmissionRepliesController < ApplicationController
	def create
		reply = parent_comment.submission_replies.create(reply_params)
		@submission = Submission.find(params[:submission_id])
		user = User.find(reply.user_id)

		UserMailer.new_submission_reply(@submission, parent_comment, User.find(parent_comment.user_id).email).deliver
		UserMailer.new_submission_reply(@submission, parent_comment, "techrisecoding@gmail.com").deliver

		Slack.chat_postMessage(text: 'New reply by ' + user.name + '! View it <' + submission_submission_comment_url(@submission, parent_comment) + '|here>.', username: 'TECHRISE Bot', channel: "#forum_questions", icon_emoji: ":smile_cat:")
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
