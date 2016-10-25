class QuizSubmissionsController < ApplicationController
  before_action :authenticate_user!

  def create
    @quiz_submission = current_user.quiz_submissions.new(quiz_submission_params.except(:checked_option_ids))

    if @quiz_submission.save
      @current_score = @quiz_submission.calculate_score(checked_option_ids: quiz_submission_params[:checked_option_ids])

      quiz_category_rating = QuizCategoryRating.create_or_rank!(current_user: current_user, 
                                                                quiz_submission: @quiz_submission, 
                                                                current_score: @current_score)

      @quiz_submission.update(quiz_category_rating: quiz_category_rating)

      update_quiz_problem_card_or_build!

      respond_to do |format|
        format.json { render json: {score: @current_score} }
      end        
    else
      respond_to do |format|
        format.json { render json: {errors: @quiz_submission.errors.full_messages}, status: :unprocessable_entity }
      end
    end
  end

  private

  def update_quiz_problem_card_or_build!
    quality_response = QuizQualityResponseCalculator.new(current_score: @current_score, 
                                                         quiz_submission: @quiz_submission, 
                                                         user: current_user)
                                                    .calculate!

    quiz_problem_card = current_user.quiz_problem_cards.find_or_create_by(quiz_problem: @quiz_submission.quiz_problem)      
    quiz_problem_card.update_interval!(quality_response)  
  end

  def quiz_submission_params
    params.require(:quiz_submission).permit(:quiz_problem_id, checked_option_ids: [])
  end
end
