class Feedback < ActiveRecord::Base
  belongs_to :user

  validates :user_id, :title, :content, :course_name, :lesson_id, presence: true
end
