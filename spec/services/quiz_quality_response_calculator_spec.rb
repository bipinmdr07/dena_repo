RSpec.describe QuizQualityResponseCalculator do
  describe "#calculate!" do
    context "there is no QuizCategoryRating for the user and quiz_category" do
      it "calculates the weighted average based on only the current score" do
        user = FactoryGirl.create(:user)
        quiz_problem = FactoryGirl.create(:quiz_problem)
        quiz_submission = FactoryGirl.create(:quiz_submission, quiz_problem: quiz_problem, user: user)

        calculator = QuizQualityResponseCalculator.new(user: user, quiz_submission: quiz_submission, current_score: 20)
        expect(calculator.calculate!).to eq(0)

        calculator = QuizQualityResponseCalculator.new(user: user, quiz_submission: quiz_submission, current_score: 52)
        expect(calculator.calculate!).to eq(1)

        calculator = QuizQualityResponseCalculator.new(user: user, quiz_submission: quiz_submission, current_score: 61)
        expect(calculator.calculate!).to eq(2)

        calculator = QuizQualityResponseCalculator.new(user: user, quiz_submission: quiz_submission, current_score: 72)
        expect(calculator.calculate!).to eq(3)

        calculator = QuizQualityResponseCalculator.new(user: user, quiz_submission: quiz_submission, current_score: 90)
        expect(calculator.calculate!).to eq(4)

        calculator = QuizQualityResponseCalculator.new(user: user, quiz_submission: quiz_submission, current_score: 100)
        expect(calculator.calculate!).to eq(5)
      end
    end

    context "there is QuizCategoryRating for the user and quiz_category" do
      it "calculates the weighted averaged based on the score of the quiz category rating" do
        user = FactoryGirl.create(:user)
        quiz_problem = FactoryGirl.create(:quiz_problem)
        quiz_submission = FactoryGirl.create(:quiz_submission, quiz_problem: quiz_problem, user: user)
        quiz_category = FactoryGirl.create(:quiz_category)
        quiz_category_rating = FactoryGirl.create(:quiz_category_rating, user: user, quiz_category: quiz_category, score: 100)

        calculator = QuizQualityResponseCalculator.new(user: user, quiz_submission: quiz_submission, current_score: 50)
        expect(calculator.calculate!).to eq(2)
        
        calculator = QuizQualityResponseCalculator.new(user: user, quiz_submission: quiz_submission, current_score: 100)
        expect(calculator.calculate!).to eq(5)
      end
    end
  end
end

