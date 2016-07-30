require 'rails_helper'

RSpec.describe StudentSession, type: :model do
  it "should not allow a submission with a mentor_session_id with a different mentor_id" do
    user = FactoryGirl.create(:user)
    mentor = FactoryGirl.create(:mentor)
    mentor_session = FactoryGirl.create(:mentor_session, user_id: user.id, mentor_id: mentor.id + 1)
    student_session = FactoryGirl.build(:student_session, mentor_session_id: mentor_session.id, user_id: user.id, mentor_id: mentor.id)      
    expect(student_session).to be_invalid
  end
end
