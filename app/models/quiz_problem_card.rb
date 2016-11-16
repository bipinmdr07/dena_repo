class QuizProblemCard < ApplicationRecord
  include IntervalUpdatable

  belongs_to :user
  belongs_to :quiz_problem

  validates :quiz_problem, uniqueness: { scope: :user }

  scope :today, -> { where(["repetition_date <= ?", Date.today])
                    .order("repetition_date ASC") }
                    
  delegate :question, to: :quiz_problem
  delegate :quiz_options, to: :quiz_problem
  delegate :course_name, to: :quiz_problem
  delegate :lesson_id, to: :quiz_problem
end
