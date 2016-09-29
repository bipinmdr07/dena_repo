class Reply < ActiveRecord::Base
  belongs_to :question
  belongs_to :user

  validates :question_id, :user_id, :content, presence: true

  delegate :name, :email, :avatar, to: :user, prefix: true
end
