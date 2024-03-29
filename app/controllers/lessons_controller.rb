class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_access!

  def index
    @current_course_lessons = current_course_lessons
    @current_course_chapters = current_course_chapters
    @current_course_title = course_title
    @current_course_link = course_link
    @progression_lesson_ids = current_user.progressions.where(course_name: controller_name.classify).pluck(:lesson_id)  
  end

  def show    
    current_controller = controller_name.classify
    
    @current_course_title = course_title
    @current_course_name = course_name
    @current_course_link = course_link
    @current_course_lessons = current_course_lessons
    @current_course_chapters = current_course_chapters

    @current_course_length = current_controller.constantize.lesson_length  
    @current_course_name = current_controller + "s"
    @current_lesson_id = params[:id]    

    @current_lesson_questions = Question.where(course_name: current_controller, 
                                               lesson_id: @current_lesson_id)
                                        .order("created_at DESC")
                                        .paginate(page: params[:page], per_page: 5)
                                        .includes(:user)

    @current_lesson_submissions = Submission.where(course_name: current_controller, 
                                                   lesson_id: @current_lesson_id)
                                            .order("created_at DESC")
                                            .includes(:user)

    @paginated_submissions = @current_lesson_submissions.paginate(page: params[:page], per_page: 5)
                                                        .includes(:user)                                 

    @current_lesson_approved_submissions = @current_lesson_submissions.approved.includes(:user)

    @submission_by_current_user = current_user.submissions.find_by(lesson_id: @current_lesson_id, 
                                                                   course_name: current_controller)
    
    @quiz_categories = QuizCategory.all.pluck(:name) if current_user.admin

    @next_lesson = @current_lesson_id.to_i + 1    

    if @current_lesson_id == 1 
      @prev_lesson = 0
    else
      @prev_lesson = @current_lesson_id.to_i - 1
    end

    @current_lesson_progression = current_user.progressions.find_by(course_name: @course_name, lesson_id: @current_lesson_id)

    @progression_lesson_ids = current_user.progressions.where(course_name: current_controller).pluck(:lesson_id)  

    @quiz_completed = !current_user.quiz_completions.find_by(course_name: current_controller, lesson_id: @current_lesson_id).nil? || QuizProblem.where(course_name: current_controller, lesson_id: @current_lesson_id).empty?

    @track = TrackFinder.new(course_name: current_controller).track
    
    @chapter_title = controller_name.classify.constantize::LESSONS.detect{|lesson| lesson.id == params[:id].to_i}.chapter.title

    render layout: "layouts/lesson"
  end

  private

  def course_name
    @course_name ||= controller_name.classify.constantize
  end

  def current_course_chapters
    @current_course_chapters ||= controller_name.classify.constantize::CHAPTERS
  end

  def current_course_lessons
    @current_course_lessons ||= controller_name.classify.constantize::LESSONS
  end

  def course_title
    @course_title ||= controller_name.classify.constantize::COURSE_TITLE
  end

  def course_link
    @course_link ||= controller_name.classify.split(/(?=[A-Z])/).join("_").downcase + "s"
  end

  def check_access!
    return if current_user.has_access_to?(controller_name.chomp("_lessons")) 
    lesson_locked_redirect
  end

  def lesson_locked_redirect
    flash[:info] = "You don't have access to this course yet! Keep up the great coding! :)"
    redirect_to courses_path
  end
end
