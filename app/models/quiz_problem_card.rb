class QuizProblemCard < ApplicationRecord
  include IntervalUpdatable

  belongs_to :user
  belongs_to :quiz_problem

  validates :quiz_problem, uniqueness: { scope: :user }
end
