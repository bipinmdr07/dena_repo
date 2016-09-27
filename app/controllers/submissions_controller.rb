class SubmissionsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_permissions, only: [:edit, :update, :destroy]
  before_action :check_duplicate, only: :create

  def index
    @submissions = current_user.submissions.all.order("created_at DESC")
  end

  def new
    @submission = Submission.new
  end

  def create
    @submission = current_user.submissions.create(submission_params)

    if @submission.valid?      
      send_email_notification!
      send_slack_notification!      
      redirect_to submission_path(@submission.id)
    else
      flash[:alert] = "Invalid, please try again."
      redirect_to new_submission_path(
        course_name: submission_params[:course_name], 
        lesson_id: submission_params[:lesson_id])
    end
  end

  def show
    @submission = Submission.includes(:submission_replies, :user, submission_replies: :user).find(params[:id])
    @user = @submission.user
  end

  def edit
  end

  def update
    if @submission.update(submission_params)
      flash[:success] = "Updated!"
      redirect_to submission_path(@submission.id)
    else
      flash[:alert] = "Woops! It looks like there has been an error. Please try again."
      render :edit
    end
  end

  def destroy
    back_to_lesson_url = PreviousLessonUrlBuilder.new(@submission).url     

    @submission.destroy
    
    redirect_to back_to_lesson_url
  end

  private

  def send_email_notification!
    UserMailer.new_submission(@submission).deliver_now
  end

  def send_slack_notification!
    Slack.chat_postMessage(text: 'New submission by ' + @submission.user_name + '! View it <' + submission_url(@submission) + '|here>.', 
                           username: 'TECHRISE Bot', channel: "#forum_questions", 
                           icon_emoji: ":smile_cat:") if Rails.env.production?
  end

  def check_duplicate
    return unless current_user.submissions.find_by(lesson_id: submission_params[:lesson_id],
                                        course_name: submission_params[:course_name])
    flash[:alert] = "You have already made a submission for this lesson. Please re-submit on your existing submission page."
  end

  def check_permissions
    @submission = Submission.find(params[:id])
    return if current_user.admin || (@submission.user_id == current_user.id)
    flash[:alert] = "Unauthorized!"
    redirect_to submission_path(@submission) 
  end

  def submission_params
    params.require(:submission).permit(:title, :content, :lesson_id, :course_name, :user_id)
  end
end
