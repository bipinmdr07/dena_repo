class RepliesController < ApplicationController
	before_action :authenticate_user!
  before_action :check_permissions, only: [:edit, :update, :destroy]

	def create
		question = Question.find(params[:question_id])
		comment = current_user.replies.create(reply_params)

		if comment.valid?
			user = User.find(comment.user_id)

			UserMailer.new_reply(question, User.find(question.user_id).email).deliver_now
			UserMailer.new_reply(question, "techrisecoding@gmail.com").deliver_now

			Slack.chat_postMessage(text: 'New reply by ' + user.name + '. View it <' + question_url(question.id) + '|here >.', 
				username: 'TECHRISE Bot', 
				channel: "#forum_questions", 
				icon_emoji: ":smile_cat:") if Rails.env.production?
		else
			flash[:alert] = "Invalid attributes, please try again."
		end
		redirect_to question_path(question.id)
	end

	def edit
	end

	def update
    if @reply.update(reply_params)
      flash[:success] = "Updated!"
      redirect_to question_path(@question.id)
    else
      flash[:alert] = "Woops! It looks like there has been an error. Please try again."
      render :edit
    end
  end

  def destroy
    @reply.destroy
    redirect_to question_path(@question)
  end

	private

	def check_permissions
		@reply = Reply.find(params[:id])
    @question = Question.find(@reply.question_id)
    return if current_user.admin || (@reply.user_id == current_user.id)
    flash[:alert] = "Unauthorized!"
    redirect_to question_path(@question)
  end

	def reply_params
		params.require(:reply).permit(:content, :user_id).merge(question_id: params[:question_id])
	end
end
