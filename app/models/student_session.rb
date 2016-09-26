class StudentSession < ActiveRecord::Base
  belongs_to :mentor_session
  belongs_to :user
  belongs_to :mentor, class_name: 'User', foreign_key: :mentor_id

  validates :user_id, :mentor_id, :public_details, :motivation_level, :mentor_session_id, presence: true
  validate :check_mentor_id

  def check_mentor_id
    return if user.mentor_user == mentor
    errors.add(:student_session, "Mentor ID doesn't match your mentor ID.")
  end
end
