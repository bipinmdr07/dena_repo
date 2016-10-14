class QuizSubmission < ApplicationRecord
  belongs_to :user
  belongs_to :quiz_problem
  
  delegate :quiz_category, to: :quiz_problem, allow_nil: false
end
