class StudentSession < ActiveRecord::Base
  belongs_to :mentor_session

  validates :user_id, :mentor_id, :public_details, :motivation_level, :mentor_session_id, presence: true
end
