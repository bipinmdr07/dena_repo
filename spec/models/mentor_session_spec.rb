require 'rails_helper'

RSpec.describe MentorSession, type: :model do
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :mentor_id }
  it { should validate_presence_of :public_details }

  it "should decrement the remaining mentor sessions for the user after new submission" do
    user = FactoryGirl.create(:user, remaining_mentor_sessions: 8)
    mentor = FactoryGirl.create(:mentor)
    FactoryGirl.create(:mentor_session, mentor_id: mentor.id, user_id: user.id)

    user.reload
    
    expect(user.remaining_mentor_sessions).to eq(7)
  end
end
