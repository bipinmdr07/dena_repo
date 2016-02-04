class LessonsController < ApplicationController
  before_action :authenticate_user!

  def index
    @lessons = controller_name.classify.constantize::LESSONS
  end

  def show
    @lesson = params[:id]
    @next_lesson = @lesson.to_i + 1 unless @lesson == controller_name.classify.constantize::LESSON_LENGTH
    @lesson == 1 ? @prev_lesson = 0 : @prev_lesson = @lesson.to_i - 1
  end


end
