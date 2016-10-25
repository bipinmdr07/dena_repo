class QuizCompletion < ApplicationRecord
  belongs_to :user

  validates :user, :lesson_id, :course_name, presence: true
  validates :course_name, uniqueness: { scope: [:lesson_id, :user_id] }
end
