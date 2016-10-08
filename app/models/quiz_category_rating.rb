class QuizCategoryRating < ActiveRecord::Base
  belongs_to :user
  belongs_to :quiz_category
end
