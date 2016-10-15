class QuizSubmissionsController < ApplicationController
  before_action :authenticate_user!

  def create
    @quiz_submission = current_user.quiz_submissions.new(quiz_submission_params.except(:checked_option_ids))

    QuizCategoryRating.create_or_rank!(current_user: current_user, 
                                       quiz_submission: @quiz_submission, 
                                       checked_option_ids: quiz_submission_params[:checked_option_ids])

    respond_to do |format|
      # format.json { render json: }
    end
      
  end

  private

  def quiz_submission_params
    params.require(:quiz_submission).permit(:quiz_problem_id, :checked_option_ids)
  end
end
