class QuizSubmissionsController < ApplicationController
  before_action :authenticate_user!

  def create
    @quiz_submission = current_user.quiz_submissions.new(quiz_submission_params.except(:checked_option_ids))

    if @quiz_submission.save
      @current_score = @quiz_submission.calculate_score(checked_option_ids: quiz_submission_params[:checked_option_ids])

      QuizCategoryRating.create_or_rank!(current_user: current_user, 
                                         quiz_submission: @quiz_submission, 
                                         current_score: @current_score)

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
    quality_response = calculate_quality_response

    quiz_problem_card = current_user.quiz_problem_cards.find_or_create_by(quiz_problem: @quiz_submission.quiz_problem)      
    quiz_problem_card.update_interval!(quality_response)  
  end

  def calculate_quality_response
    quiz_category_rating_weight = 0.3
    current_score_weight = 0.7

    quiz_problem = @quiz_submission.quiz_problem

    quiz_category_rating = QuizCategoryRating.find_by(user: current_user, quiz_category: @quiz_submission.quiz_category)
    quiz_category_rating_score = quiz_category_rating.try(:score) ? quiz_category_rating.score : 100

    weighted_average = quiz_category_rating_score * quiz_category_rating_weight + @current_score * current_score_weight

    case
      when weighted_average.between?(0, 50)
        quality_response = 0
      when weighted_average.between?(51, 60)
        quality_response = 1
      when weighted_average.between?(61, 70)
        quality_response = 2
      when weighted_average.between?(71, 80)
        quality_response = 3
      when weighted_average.between?(81, 90)
        quality_response = 4
      when weighted_average.between?(91, 100)
        quality_response = 5
      else
        quality_response = 0
    end

    return quality_response
  end

  def quiz_submission_params
    params.require(:quiz_submission).permit(:quiz_problem_id, checked_option_ids: [])
  end
end
