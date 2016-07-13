class Submission < ActiveRecord::Base
	has_many :submission_replies, dependent: :destroy
  belongs_to :user
  
  validates :title, :content, :lesson_id, :user_id, :course_name, presence: true
end
