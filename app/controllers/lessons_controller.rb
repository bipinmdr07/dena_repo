class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_access!

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

  private

  def check_access!
    if controller_name.classify == "IntroLesson"
      return if current_user.intro_access?
      lesson_locked_redirect
    elsif controller_name.classify == "HtmlCssLesson"
      return if current_user.html_css_access?
      lesson_locked_redirect
    elsif controller_name.classify == "RubyLesson"
      return if current_user.ruby_fundamentals_access?
      lesson_locked_redirect
    elsif controller_name.classify == "IdeatorLesson"
      return if current_user.ideator_access?
      lesson_locked_redirect
    elsif controller_name.classify == "RubyCoreLesson"
      return if current_user.ruby_core_access?
      lesson_locked_redirect
    end
  end

  def lesson_locked_redirect
    flash[:alert] = "You don't have access to this course yet! Keep up the great coding! :)"
    redirect_to courses_path
  end



end
