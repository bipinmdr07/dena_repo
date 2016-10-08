class QuizProblem < ActiveRecord::Base
  belongs_to :quiz_category
  has_many :quiz_options  

  validates :question, :lesson_id, :course_name, presence: true
end
