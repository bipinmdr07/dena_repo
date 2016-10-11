class MentorSession < ApplicationRecord
  belongs_to :user
  belongs_to :mentor, class_name: "User", foreign_key: :mentor_id
  has_one :student_session

  validates :public_details, :mentor_id, :user_id, presence: true
  after_create :decrement_available_mentor_sessions!

  protected

  def decrement_available_mentor_sessions!
    return unless self.user && self.user.remaining_mentor_sessions.present?
    self.user.decrement!(:remaining_mentor_sessions)
  end

  private

end
