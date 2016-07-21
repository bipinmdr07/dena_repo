require 'rails_helper'

RSpec.describe Submission, type: :model do
  it { should validate_presence_of :title }
  it { should validate_presence_of :content }
  it { should validate_presence_of :lesson_id }
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :course_name }

  it "should not allow multiple submissions by same user" do
    user = FactoryGirl.create(:user)
    submission = FactoryGirl.create(:submission, user_id: user.id)
    expect{ FactoryGirl.create(:submission, user_id: user.id) }.to raise_error(StandardError)
  end
end