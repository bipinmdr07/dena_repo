class SubmissionReply < ApplicationRecord
  include Notifiable

	belongs_to :submission
  belongs_to :user

  validates :submission_id, :user_id, :content, presence: true

  delegate :name, :email, :avatar, :mentor, to: :user, prefix: true

  private

  def notifiable
    submission
  end
end
