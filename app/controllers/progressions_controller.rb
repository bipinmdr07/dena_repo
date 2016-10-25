class ProgressionsController < ApplicationController
  before_action :authenticate_user!

  respond_to :js, :html, :json

  def create
    @current_course_link = current_course_link
    @current_course_title = current_course_title
    @current_course_lessons = current_course_lessons
    @current_course_chapters = current_course_chapters

    progression = Progression.new(progression_params) 

    if progression.save
      build_variables_for_lesson_show_page
      progression.create_activity key: 'progression.create', owner: current_user, 
      parameters: {lesson_id: params[:progression][:lesson_id], course_name: params[:progression][:course_name]}
    
      respond_to do |format|
        format.html {}
        format.js {}
      end
    end
  end

  def destroy    
    @current_course_link = current_course_link
    @current_course_title = current_course_title
    @current_course_lessons = current_course_lessons
    @current_course_chapters = current_course_chapters
    

    progression = Progression.find(params[:id])
    progression.destroy

    build_variables_for_lesson_show_page
    
    respond_to do |format|
      format.html {}
      format.js {}
    end
  end

  private

  def build_variables_for_lesson_show_page    
    @quiz_completed = !current_user.quiz_completions.find_by(progression_params).nil? || QuizProblem.where(progression_params.except(:user_id)).empty?
    @course_name = progression_params[:course_name].constantize
    @current_lesson_id = progression_params[:lesson_id]

    @next_lesson = @current_lesson_id.to_i + 1    

    if @current_lesson_id == 1 
      @prev_lesson = 0
    else
      @prev_lesson = @current_lesson_id.to_i - 1
    end

    @current_course_length = @course_name.lesson_length  
    @current_course_link = progression_params[:course_name].classify.split(/(?=[A-Z])/).join("_").downcase + "s"
    @current_lesson_progression = current_user.progressions.find_by(course_name: @course_name, lesson_id: @current_lesson_id)
    @progression_lesson_ids = current_user.progressions.where(course_name: params[:progression][:course_name]).pluck(:lesson_id)  
  end

  def current_course_chapters
    params[:progression][:course_name].constantize::CHAPTERS
  end

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
    params.require(:progression).permit(:lesson_id, :course_name).merge(user_id: current_user.id)
  end
end
