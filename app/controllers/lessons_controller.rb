class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_access!

  def index
    @lessons = controller_name.classify.constantize::LESSONS
    @course_title = controller_name.classify.constantize::COURSE_TITLE
    @lesson_link = controller_name.classify.split(/(?=[A-Z])/).join("_").downcase + "s"
  end

  def show
    controller = controller_name.classify
    
    @lesson_link = controller.split(/(?=[A-Z])/).join("_").downcase + "s"
    @course_title = controller.constantize::COURSE_TITLE
    @lessons = controller.constantize::LESSONS
    @lesson = params[:id]
    @lesson_length = controller.constantize::LESSON_LENGTH

    @next_lesson = @lesson.to_i + 1
    @lesson == 1 ? @prev_lesson = 0 : @prev_lesson = @lesson.to_i - 1
    @course_link = controller.split(/(?=[A-Z])/).join("_").downcase + "s"
    @course_name = controller + "s"

    @questions = Question.where(course_name: controller, lesson_id: params[:id]).order("created_at DESC").paginate(page: params[:page], per_page: 5)

    @paginated_submissions = Submission.where(course_name: controller, lesson_id: params[:id]).order("created_at DESC").paginate(page: params[:page], per_page: 5)
    @all_submissions = Submission.where(course_name: controller, lesson_id: params[:id]).order("created_at DESC")
    @submissions = @all_submissions.where(approved: true)
    @user_submission = current_user.submissions.find_by(lesson_id: params[:id], course_name: controller_name.classify)
    @submission_user_ids = @submissions.pluck(:user_id).uniq.first(10)
  end

  private

  def check_access!
    lesson_locked_redirect unless current_user.has_access?

    if controller_name.classify == "IntroLesson"
      return if current_user.intro_access?
      lesson_locked_redirect
    elsif controller_name.classify == "HtmlCssLesson"
      return if current_user.html_css_access?
      lesson_locked_redirect
    elsif controller_name.classify == "BootstrapLesson"
      return if current_user.bootstrap_access?
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
    elsif controller_name.classify == "InstapostLesson"
      return if current_user.instapost_access?
      lesson_locked_redirect
    elsif controller_name.classify == "GithubLesson"
      return if current_user.github_access?
      lesson_locked_redirect
    elsif controller_name.classify == "JavascriptLesson"
      return if current_user.javascript_access?
      lesson_locked_redirect
    end
  end

  def lesson_locked_redirect
    flash[:alert] = "You don't have access to this course yet! Keep up the great coding! :)"
    redirect_to courses_path
  end
end
