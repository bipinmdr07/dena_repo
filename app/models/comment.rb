class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :student_question

  validates :content, :user_id, :student_question_id, presence: true
end
