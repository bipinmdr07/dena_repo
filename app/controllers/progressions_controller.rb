class ProgressionsController < ApplicationController
  before_action :authenticate_user!

  respond_to :js, :html, :json

  def create
    respond_to do |format|
      format.html {}
      format.js {
        course_name = params[:progression][:course_name]
        progression = Progression.create(progression_params)
        if progression.valid?
          progression.create_activity key: 'progression.create', owner: current_user,
          parameters: {lesson_id: params[:progression][:lesson_id], course_name: course_name}
        end

        # if progression for course_name = lesson length and number of submission = submission count
        #   unlock next lesson
        puts current_user.progressions.where(course_name: course_name).count
        progressions = current_user.progressions.where(course_name: course_name)
        return unless progressions.count >= course_name.constantize::LESSON_LENGTH
        submissions = current_user.submissions.where(course_name: course_name, approved: true)
        return unless submissions.count >= course_name.constantize::SUBMISSION_COUNT

        i = current_user.progressions.pluck(:course_name).uniq.count
        next_course = Tags::LESSONS.keys[i].chomp('lessons') + 'access'
        current_user.unlock_next_course!(next_course)
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
