class ProgressionsController < ApplicationController
  before_action :authenticate_user!

  respond_to :js, :html, :json

  def create
    respond_to do |format|
      format.html {}
      format.js { 
        progression = Progression.create(progression_params) 
        if progression.valid?
          progression.create_activity key: 'progression.create', owner: current_user, 
          parameters: {lesson_id: params[:progression][:lesson_id], course_name: params[:progression][:course_name]}
        end
      }
    end
  end

  def destroy
    respond_to do |format|
      format.html {}
      format.js { 
        progression = Progression.find_by(progression_params) 
        progression.destroy
      }
    end
  end

  private

  def progression_params
    params.require(:progression).permit(:lesson_id, :course_name).merge(user_id: current_user.id) # I don't know why this + 0 works but it prevents a bug with RankedModel
  end
end
