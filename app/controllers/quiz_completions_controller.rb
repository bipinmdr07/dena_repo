class QuizCompletionsController < ApplicationController
  before_action :authenticate_user!

  def create
    return if current_user.quiz_completions.find_by(quiz_completion_params)

    @quiz_completion = current_user.quiz_completions.new(quiz_completion_params)

    build_variables_for_lesson_show_page
    @quiz_completed = true

    if @quiz_completion.save
      respond_to do |format|
        format.js {}
        format.json {}
      end
    else
      respond_to do |format|
        format.json { render json: :unprocessable_entity }
      end
    end
  end

  private

  def build_variables_for_lesson_show_page
    @course_name = quiz_completion_params[:course_name].constantize
    @current_lesson_id = quiz_completion_params[:lesson_id]

    @next_lesson = @current_lesson_id.to_i + 1    

    if @current_lesson_id == 1 
      @prev_lesson = 0
    else
      @prev_lesson = @current_lesson_id.to_i - 1
    end

    @current_course_length = @course_name.lesson_length  
    @current_course_link = quiz_completion_params[:course_name].classify.split(/(?=[A-Z])/).join("_").downcase + "s"
    @current_lesson_progression = current_user.progressions.find_by(course_name: @course_name, lesson_id: @current_lesson_id)
  end

  def quiz_completion_params
    params.require(:quiz_completion).permit(:lesson_id, :course_name)
  end
end
