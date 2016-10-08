class SubmissionRepliesController < ApplicationController
	before_action :authenticate_user!
	before_action :check_permissions, only: [:edit, :update, :destroy]


	def create
		@reply = current_user.submission_replies.create(reply_params)

		if @reply.valid?
      create_notifications!      
      send_email_notification!
			send_slack_notification!

      respond_to do |format|
        format.json { render json: {reply: @reply, 
                                    user_is_mentor: @reply.user_mentor, 
                                    user_avatar_url: @reply.user_avatar.url, 
                                    user_name: @reply.user_name,
                                    display_post_links: current_user == @reply.user || current_user.admin,
                                    content: MarkdownParser.new(@reply.content).parsed}.to_json }
        format.html { redirect_to submission_path(current_submission) }
      end			
		else
			flash[:alert] = "Invalid attributes, please try again."

      respond_to do |format|
        format.json { render json: @reply.errors, status: :unprocessable_entity }
        format.html { redirect_to submission_path(current_submission) }
      end
		end
	end

	def edit
	end

	def update
    if current_submission_reply.update(reply_params)
      respond_to do |format|        
        format.json { render json: MarkdownParser.new(current_submission_reply.content).parsed.to_json }
        format.html do
          flash[:success] = "Updated!"
          redirect_to submission_path(current_submission_reply.submission)
        end
      end      
    else
      respond_to do |format|        
        format.json { render json: current_submission_reply.errors, status: :unprocessable_entity }
        format.html do
          flash[:alert] = "Woops! It looks like there has been an error. Please try again."
          render :edit
        end
      end             
    end
  end

  def destroy
    current_submission_reply.destroy
    respond_to do |format|
      format.json { head :no_content }
      format.html { redirect_to submission_path(current_submission_reply.submission_id) }
    end    
  end

	private

  def send_slack_notification!
    Slack.chat_postMessage(text: 'New reply by ' + @reply.user_name + '! View it <' + submission_url(current_submission) + '|here>.', 
        username: 'TECHRISE Bot', 
        channel: "#forum_questions", 
        icon_emoji: ":smile_cat:") if Rails.env.production?
  end 

  def send_email_notification!
    UserMailer.new_submission_reply(submission: current_submission, email: current_submission.user_email).deliver_later
  end

  def create_notifications!
    (current_submission.users.uniq + [current_submission.user] - [current_user]).each do |user|
      Notification.create(recipient: user, actor: current_user, action: "replied to", notifiable: current_submission)
    end
  end

  def current_submission
    @current_submission ||= Submission.find(params[:submission_id])
  end

  helper_method :current_submission_reply
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
