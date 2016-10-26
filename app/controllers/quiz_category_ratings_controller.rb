class QuizCategoryRatingsController < ApplicationController
  def index
    @ratings = current_user.quiz_category_ratings.includes(:quiz_category).order("score DESC")
  end
end
