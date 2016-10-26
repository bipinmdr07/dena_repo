class QuizQualityResponseCalculator
  QUIZ_CATEGORY_RATING_WEIGHT = 0.3
  CURRENT_SCORE_WEIGHT = 0.7

  def initialize(current_score:, quiz_submission:, user:)
    @current_score = current_score
    @quiz_submission = quiz_submission
    @user = user
  end

  def calculate!
    quiz_category_rating = QuizCategoryRating.find_by(user: @user, quiz_category: @quiz_submission.quiz_category)
    @quiz_category_rating_score = quiz_category_rating.try(:score) ? quiz_category_rating.score : 0
    weighted_average = calculate_weighted_average

    calculate_quality_response(weighted_average: weighted_average)    
  end

  private

  def calculate_weighted_average
    if @quiz_category_rating_score == 0
      @current_score
    else
      @quiz_category_rating_score * QUIZ_CATEGORY_RATING_WEIGHT + @current_score * CURRENT_SCORE_WEIGHT
    end
  end

  def calculate_quality_response(weighted_average:)
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
  end

end