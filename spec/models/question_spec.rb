require 'rails_helper'

RSpec.describe Question, type: :model do

  it "shouldn't validate presence of lesson_id if question is mentor post" do
    user = FactoryGirl.create(:user)
    question = FactoryGirl.build(:question, mentor_post: true, lesson_id: nil, user_id: user.id, mentor_post: true)
    question.save
    expect(question).to be_valid
  end

  it "shouldn't validate presence of course_name if question is mentor post" do
    user = FactoryGirl.create(:user)
    question = FactoryGirl.build(:question, mentor_post: true, course_name: nil, user_id: user.id, mentor_post: true)
    question.save
    expect(question).to be_valid
  end
end
