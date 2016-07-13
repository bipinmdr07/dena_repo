class SubmissionCommentsController < ApplicationController
	before_action :authenticate_user!

	def new
		@submission_comment = SubmissionComment.new
	end

	def create
		@submission_comment = current_user.submission_comments.create(comment_params)

		if @submission_comment.valid?
			user = User.find(@submission_comment.user_id)
			UserMailer.new_submission(Submission.find(params[:submission_id]), @submission_comment).deliver
			Slack.chat_postMessage(text: 'New submission by ' + user.name + '! View it <' + submission_submission_comment_url(@submission_comment.submission_id, @submission_comment) + '|here>.', username: 'TECHRISE Bot', channel: "#forum_questions", icon_emoji: ":smile_cat:")
			redirect_to submission_submission_comment_path(@submission_comment.submission_id, @submission_comment)
		else
			flash[:alert] = "Invalid, please try again."
			redirect_to new_submission_submission_comment_path(
				submission_id: comment_params[:submission_id], 
				lesson: comment_params[:lesson])
		end
	end

	def show
		@submission_comment = SubmissionComment.find(params[:id])
		@user = User.find(@submission_comment.user_id)
	end

	private

	def comment_params
		params.require(:submission_comment).permit(:title, :description, :lesson, :submission_id)
	end

end
