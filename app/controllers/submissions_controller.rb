class SubmissionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @submission = current_user.submissions.all
  end

  def new
    @submission = Submission.new
  end

  def create
    @submission = current_user.submissions.create(submission_params)

    if @submission.valid?
      user = User.find(@submission.user_id)
      UserMailer.new_submission(@submission).deliver_now
      Slack.chat_postMessage(text: 'New submission by ' + user.name + '! View it <' + submission_url(@submission) + '|here>.', username: 'TECHRISE Bot', channel: "#forum_questions", icon_emoji: ":smile_cat:") if Rails.env.production?
      redirect_to submission_path(@submission.id)
    else
      flash[:alert] = "Invalid, please try again."
      redirect_to new_submission_path(
        course_name: submission_params[:course_name], 
        lesson_id: submission_params[:lesson_id])
    end
  end

  def show
    @submission = Submission.find(params[:id])
    @user = User.find(@submission.user_id)
  end

  private

  def submission_params
    params.require(:submission).permit(:title, :content, :lesson_id, :course_name, :user_id)
  end
end
