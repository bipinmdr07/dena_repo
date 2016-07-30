class StudentSession < ActiveRecord::Base
  belongs_to :mentor_session

  validates :user_id, :mentor_id, :public_details, :motivation_level, :mentor_session_id, presence: true

  validate :check_mentor_id

  def check_mentor_id
    return if User.find(user_id).mentor_id == mentor_id
    errors.add(:student_session, "Mentor ID doesn't match your mentor ID.")
  end
end
