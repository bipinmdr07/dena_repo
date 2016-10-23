RSpec.describe QuizQualityResponseCalculator do
  describe "#calculate!" do
    context "there is no QuizCategoryRating for the user and quiz_category" do
      it "calculates the weighted average based on only the current score" do
        user = FactoryGirl.create(:user)
        quiz_problem = FactoryGirl.create(:quiz_problem)
        quiz_submission = FactoryGirl.create(:quiz_submission, quiz_problem: quiz_problem)

        current_score = 20
        calculator = QuizQualityResponseCalculator.new(user: user, quiz_submission: quiz_submission, current_score: current_score)
        expect(calculator.calculate!).to eq(0)

        current_score = 52
        calculator = QuizQualityResponseCalculator.new(user: user, quiz_submission: quiz_submission, current_score: current_score)
        expect(calculator.calculate!).to eq(1)

        current_score = 61
        calculator = QuizQualityResponseCalculator.new(user: user, quiz_submission: quiz_submission, current_score: current_score)
        expect(calculator.calculate!).to eq(2)

        current_score = 72
        calculator = QuizQualityResponseCalculator.new(user: user, quiz_submission: quiz_submission, current_score: current_score)
        expect(calculator.calculate!).to eq(3)

        current_score = 90
        calculator = QuizQualityResponseCalculator.new(user: user, quiz_submission: quiz_submission, current_score: current_score)
        expect(calculator.calculate!).to eq(4)

        current_score = 100
        calculator = QuizQualityResponseCalculator.new(user: user, quiz_submission: quiz_submission, current_score: current_score)
        expect(calculator.calculate!).to eq(5)
      end
    end

    context "there is QuizCategoryRating for the user and quiz_category" do
      it "calculates the weighted averaged based on the score of the quiz category rating" do

      end
    end
  end
end

