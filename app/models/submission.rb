class Submission < ApplicationRecord
  belongs_to :user
	has_many :submission_replies, dependent: :destroy
  has_many :users, through: :submission_replies

  validates :title, :content, :lesson_id, :user_id, :course_name, presence: true
  validates :course_name, uniqueness: { scope: [:lesson_id, :user_id] }

  delegate :name, :email, :avatar, :admitted, :mentor, to: :user, prefix: true

  scope :approved, -> { where(approved: true) }
  scope :unapproved, -> { where(approved: false) }

end
