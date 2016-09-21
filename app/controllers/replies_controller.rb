class RepliesController < ApplicationController
	before_action :authenticate_user!
  before_action :check_permissions, only: [:edit, :update, :destroy]

	def create    
		reply = current_user.replies.create(reply_params)

		if reply.valid?			
			# Create notifications
			(current_question.users.uniq + [current_question.user] - [current_user]).each do |user|
			  Notification.create(recipient: user, actor: current_user, action: "replied to", notifiable: current_question)
			end

			UserMailer.new_reply(current_question, current_question.user_email).deliver_now
			UserMailer.new_reply(current_question, "techrisecoding@gmail.com").deliver_now

			Slack.chat_postMessage(text: 'New reply by ' + reply.user_name + '. View it <' + question_url(current_question.id) + '|here >.', 
				username: 'TECHRISE Bot', 
				channel: "#forum_questions", 
				icon_emoji: ":smile_cat:") if Rails.env.production?
		else
			flash[:alert] = "Invalid attributes, please try again."
		end
		redirect_to question_path(current_question)
	end

	def edit
	end

	def update
    if current_reply.update(reply_params)
      flash[:success] = "Updated!"
      redirect_to question_path(current_reply.question)
    else
      flash[:alert] = "Woops! It looks like there has been an error. Please try again."
      render :edit
    end
  end

  def destroy
    current_reply.destroy
    redirect_to question_path(current_reply.question)
  end

	private

  def current_question
    @current_question ||= Question.find(params[:question_id])
  end

  helper_method :current_reply
  def current_reply
    @current_reply ||= Reply.find(params[:id])
  end

	def check_permissions
    return if current_user.admin || (current_reply.user == current_user)
    flash[:alert] = "Unauthorized!"
    redirect_to question_path(current_reply.question)
  end

	def reply_params
		params.require(:reply).permit(:content, :user_id).merge(question_id: params[:question_id])
	end
end
