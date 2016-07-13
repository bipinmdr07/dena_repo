class RepliesController < ApplicationController
	before_action :authenticate_user!

	def create
		question = Question.find(params[:question_id])
		comment = current_user.replies.create(reply_params)

		if comment.valid?
			user = User.find(comment.user_id)

			UserMailer.new_reply(question, User.find(question.user_id).email).deliver_now
			UserMailer.new_reply(question, "techrisecoding@gmail.com").deliver

			Slack.chat_postMessage(text: 'New reply by ' + user.name + '. View it <' + question_url(question.id) + '|here >.', 
				username: 'TECHRISE Bot', 
				channel: "#forum_questions", 
				icon_emoji: ":smile_cat:") if Rails.env.production?
		else
			flash[:alert] = "Invalid attributes, please try again."
		end
		redirect_to question_path(question.id)
	end

	private

	def reply_params
		params.require(:reply).permit(:content, :user_id).merge(question_id: params[:question_id])
	end
end
