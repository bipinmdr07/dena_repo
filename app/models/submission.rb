class Submission < ActiveRecord::Base
  belongs_to :user
	has_many :submission_replies, dependent: :destroy
  has_many :users, through: :submission_replies
  
  validates :title, :content, :lesson_id, :user_id, :course_name, presence: true
  validates :course_name, uniqueness: { scope: [:lesson_id, :user_id] }

  delegate :name, to: :user, prefix: true
  delegate :avatar, to: :user, prefix: true
end
