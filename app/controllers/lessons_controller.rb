class LessonsController < ApplicationController
  before_action :authenticate_user!

  def index
    @lessons = controller_name.classify.constantize::LESSONS
    @course_title = controller_name.classify.constantize::COURSE_TITLE
    @lesson_link = controller_name.classify.split(/(?=[A-Z])/).join("_").downcase + "s"
  end

  def show
    @lesson = params[:id]
    @lesson_length = controller_name.classify.constantize::LESSON_LENGTH
    @next_lesson = @lesson.to_i + 1 
    @lesson == 1 ? @prev_lesson = 0 : @prev_lesson = @lesson.to_i - 1
    @course_link = controller_name.classify.split(/(?=[A-Z])/).join("_").downcase + "s"
    @course_name = controller_name.classify + "s"
  end



end
