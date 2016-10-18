class QuizCategoryRatingsController < ApplicationController
  def index
    @ratings = current_user.quiz_category_ratings.includes(:quiz_category).all
  end
end
