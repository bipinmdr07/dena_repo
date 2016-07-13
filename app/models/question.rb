class Question < ActiveRecord::Base
  belongs_to :user
  has_many :replies, dependent: :destroy

  validates :title, :content, :user_id, :lesson_id, :course_name, presence: true
end
