class FeedbacksController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!, only: [:index, :destroy]

  def create
    @feedback.create(feedback_params)
    redirect_to root_path
  end

  private
  def feedback_params
    params.require(:feedback).permit(:user_id, :title, :content, :course_name, :lesson_id)
  end
end
