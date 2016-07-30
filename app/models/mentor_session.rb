class MentorSession < ActiveRecord::Base
  belongs_to :user
  belongs_to :mentor, class_name: "User"
  has_one :student_session

  validates :public_details, :mentor_id, :user_id, presence: true
  after_create :decrement_available_mentor_sessions!

  def decrement_available_mentor_sessions!
    return unless self.user && self.user.remaining_mentor_sessions.present?
    self.user.update(remaining_mentor_sessions: self.user.remaining_mentor_sessions - 1)
  end

  private

end
