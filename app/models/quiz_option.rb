class QuizOption < ActiveRecord::Base
  belongs_to :quiz_problem

  validates :quiz_problem_id, :content, presence: true
  validates_inclusion_of :correct, in: [true, false]
end
