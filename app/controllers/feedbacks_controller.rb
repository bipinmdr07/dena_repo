class FeedbacksController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!, only: [:index, :destroy, :show]

  def index
    @feedbacks = Feedback.all.order("created_at DESC").paginate(page: params[:page], per_page: 10)
  end

  def create
    @feedback = current_user.feedbacks.create(feedback_params)
    course_name = @feedback.course_name.underscore + "s"
    link = "/" + course_name + "/" + @feedback.lesson_id.to_s
    redirect_to link
  end

  def show
    @feedback = Feedback.find(params[:id])
  end

  def destroy
    @feedback = Feedback.find(params[:id])
    @feedback.destroy
    redirect_to dashboard_path
  end

  private
  def feedback_params
    params.require(:feedback).permit(:title, :content, :course_name, :lesson_id)
  end
end
