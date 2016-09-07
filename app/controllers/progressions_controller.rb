class ProgressionsController < ApplicationController
  before_action :authenticate_user!

  respond_to :js, :html, :json

  def create
    @current_course_link = current_course_link
    @current_course_title = current_course_title
    @current_course_lessons = current_course_lessons

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
    @current_course_link = current_course_link
    @current_course_title = current_course_title
    @current_course_lessons = current_course_lessons

    respond_to do |format|
      format.html {}
      format.js { 
        progression = Progression.find_by(progression_params) 
        progression.destroy
      }
    end
  end

  private

  def current_course_link
    params[:progression][:course_name].split(/(?=[A-Z])/).join("_").downcase + "s"
  end

  def current_course_title
    params[:progression][:course_name].constantize::COURSE_TITLE
  end

  def current_course_lessons
    params[:progression][:course_name].constantize::LESSONS
  end

  def progression_params
    params.require(:progression).permit(:lesson_id, :course_name).merge(user_id: current_user.id) # I don't know why this + 0 works but it prevents a bug with RankedModel
  end
end
