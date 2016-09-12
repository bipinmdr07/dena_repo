class SubmissionRepliesController < ApplicationController
	before_action :authenticate_user!
	before_action :check_permissions, only: [:edit, :update, :destroy]


	def create
		reply = current_user.submission_replies.create(reply_params)

		if reply.valid?
      # Create notifications
      (current_submission.users.uniq + [current_submission.user] - [current_user]).each do |user|
        Notification.create(recipient: user, actor: current_user, action: "replied to", notifiable: current_submission)
      end

			UserMailer.new_submission_reply(current_submission, current_submission.user_email).deliver_now
			UserMailer.new_submission_reply(current_submission, "techrisecoding@gmail.com").deliver_now
			Slack.chat_postMessage(text: 'New reply by ' + reply.user_name + '! View it <' + submission_url(current_submission) + '|here>.', 
				username: 'TECHRISE Bot', 
				channel: "#forum_questions", 
				icon_emoji: ":smile_cat:") if Rails.env.production?
		else
			flash[:alert] = "Invalid attributes, please try again."
		end
		redirect_to submission_path(current_submission)
	end

	def edit
	end

	def update
    if current_submission_reply.update(reply_params)
      flash[:success] = "Updated!"
      redirect_to submission_path(current_submission_reply.submission_id)
    else
      flash[:alert] = "Woops! It looks like there has been an error. Please try again."
      render :edit
    end
  end

  def destroy
    current_submission_reply.destroy
    redirect_to submission_path(current_submission_reply.submission_id)
  end

	private

  def current_submission
    @current_submission ||= Submission.find(params[:submission_id])
  end

  def current_submission_reply
    @current_submission_reply ||= SubmissionReply.find(params[:id])
  end

	def check_permissions
    return if current_user.admin || (current_submission_reply.user == current_user)
    flash[:alert] = "Unauthorized!"
    redirect_to submission_path(current_submission_reply.submission_id) 
  end

	def reply_params
		params.require(:submission_reply).permit(:content, :user_id).merge(submission_id: params[:submission_id])
	end
end
