class SubmissionCommentsController < ApplicationController
	before_filter :authenticate_user!

	def new
		@submission_comment = SubmissionComment.new
	end

	def create
		@submission_comment = current_user.submission_comments.create(comment_params)
		redirect_to submission_submission_comment_path(@submission_comment.submission_id, @submission_comment)
	end

	def show
		@submission_comment = SubmissionComment.find(params[:id])
	end

	private

	def comment_params
		params.require(:submission_comment).permit(:title, :description, :lesson, :submission_id)
	end

end