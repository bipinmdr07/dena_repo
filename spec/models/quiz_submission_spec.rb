require 'rails_helper'

RSpec.describe QuizSubmission, type: :model do
  describe "#calculate_score" do
    context "user answers correctly" do 
      it "returns 1.0" do
        user = FactoryGirl.create(:user)
        quiz_problem = FactoryGirl.create(:quiz_problem)
        quiz_submission = FactoryGirl.create(:quiz_submission, user: user, quiz_problem: quiz_problem)
        quiz_option_1 = FactoryGirl.create(:quiz_option, id: 1, correct: true, quiz_problem: quiz_problem)
        quiz_option_2 = FactoryGirl.create(:quiz_option, id: 2, correct: false, quiz_problem: quiz_problem)
        quiz_option_3 = FactoryGirl.create(:quiz_option, id: 3, correct: false, quiz_problem: quiz_problem)
        quiz_option_4 = FactoryGirl.create(:quiz_option, id: 4, correct: false, quiz_problem: quiz_problem)
        checked_option_ids = [1, 2]

        expect(quiz_submission.calculate_score(checked_option_ids: checked_option_ids)).to eq(1.0)
      end
    end

    context "2 out of 4 options are correct and user answers only 1 correctly" do
      it "returns 0.50" do
        user = FactoryGirl.create(:user)
        quiz_problem = FactoryGirl.create(:quiz_problem)
        quiz_submission = FactoryGirl.create(:quiz_submission, user: user, quiz_problem: quiz_problem)
        quiz_option_1 = FactoryGirl.create(:quiz_option, id: 1, correct: true, quiz_problem: quiz_problem)
        quiz_option_2 = FactoryGirl.create(:quiz_option, id: 2, correct: false, quiz_problem: quiz_problem)
        quiz_option_3 = FactoryGirl.create(:quiz_option, id: 3, correct: true, quiz_problem: quiz_problem)
        quiz_option_4 = FactoryGirl.create(:quiz_option, id: 4, correct: false, quiz_problem: quiz_problem)
        checked_option_ids = [1, 2]

        expect(quiz_submission.calculate_score(checked_option_ids: checked_option_ids)).to eq(0.50)
      end
    end
  end
end
