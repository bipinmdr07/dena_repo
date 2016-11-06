class Reply < ApplicationRecord
  include Notifiable

  belongs_to :question
  belongs_to :user

  validates :question_id, :user_id, :content, presence: true

  delegate :name, :email, :avatar, :mentor, to: :user, prefix: true

  private

  def notifiable
    question
  end
end
