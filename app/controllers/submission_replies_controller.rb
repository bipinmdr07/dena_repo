class SubmissionRepliesController < ApplicationController
	before_action :authenticate_user!
	before_action :check_permissions, only: [:edit, :update, :destroy]


	def create
		@submission = Submission.find(params[:submission_id])
		reply = current_user.submission_replies.create(reply_params)

		if reply.valid?
			user = User.find(reply.user_id)
			UserMailer.new_submission_reply(@submission, User.find(@submission.user_id).email).deliver_now
			UserMailer.new_submission_reply(@submission, "techrisecoding@gmail.com").deliver_now
			Slack.chat_postMessage(text: 'New reply by ' + user.name + '! View it <' + submission_url(@submission) + '|here>.', 
				username: 'TECHRISE Bot', 
				channel: "#forum_questions", 
				icon_emoji: ":smile_cat:") if Rails.env.production?
		else
			flash[:alert] = "Invalid attributes, please try again."
		end
		redirect_to submission_path(@submission)
	end

	def edit
	end

	def update
    if @submission_reply.update(reply_params)
      flash[:success] = "Updated!"
      redirect_to submission_path(@submission)
    else
      flash[:alert] = "Woops! It looks like there has been an error. Please try again."
      render :edit
    end
  end

  def destroy
    @submission_reply.destroy
    redirect_to submission_path(@submission)
  end

	private

	def check_permissions
    @submission_reply = SubmissionReply.find(params[:id])
    @submission = Submission.find(@submission_reply.submission_id)
    return if current_user.admin || (@submission_reply.user_id == current_user.id)
    flash[:alert] = "Unauthorized!"
    redirect_to submission_path(@submission) 
  end


	def reply_params
		params.require(:submission_reply).permit(:content, :user_id).merge(submission_id: params[:submission_id])
	end
end
