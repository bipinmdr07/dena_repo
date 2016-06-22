class ProgressionsController < ApplicationController
  before_action :authenticate_user!

  respond_to :js, :html, :json

  def create
    respond_to do |format|
      format.html {}
      format.js { 
        progression = current_user.progressions.create(progression_params) 
        progression.create_activity key: 'progression.create', owner: current_user, 
        parameters: {lesson_id: params[:progression][:lesson_id], course_name: params[:progression][:course_name]}
      }
    end
  end

  private

  def progression_params
    params.require(:progression).permit(:user_id, :lesson_id, :course_name)
  end
end
