require 'rails_helper'

RSpec.describe QuizCategoryRating, type: :model do
  describe "self.create_or_rank!" do
    context "there is no rating for the quiz_category for the current user" do
      it "creates a new QuizCategoryRating object" do
        user = FactoryGirl.create(:user)
        quiz_problem = FactoryGirl.create(:quiz_problem)
        checked_option_ids = [1, 2]
        quiz_submission = FactoryGirl.create(:quiz_submission, user_id: user.id, 
                                                               quiz_problem_id: quiz_problem.id)
        quiz_category = FactoryGirl.create(:quiz_category)

        expect(quiz_submission).to receive(:quiz_category).and_return(quiz_category)

        expect {
          QuizCategoryRating.create_or_rank!(current_user: user, 
                                             quiz_submission: quiz_submission, 
                                             current_score: 100)
        }.to change(QuizCategoryRating, :count).by(1)
      end
    end

    context "there is already an existing rating for the quiz_category for the current user" do
      it "updates the score" do
        user = FactoryGirl.create(:user)
        quiz_problem = FactoryGirl.create(:quiz_problem)
        quiz_category = FactoryGirl.create(:quiz_category)
        quiz_category_rating = FactoryGirl.create(:quiz_category_rating, user: user, 
                                                                         quiz_category_id: quiz_category.id, 
                                                                         score: 80, 
                                                                         quiz_submissions_count: 2)        
        quiz_submission = FactoryGirl.create(:quiz_submission, user_id: user.id, 
                                                               quiz_problem_id: quiz_problem.id)                        

        expect(quiz_submission).to receive(:quiz_category).and_return(quiz_category)

        QuizCategoryRating.create_or_rank!(current_user: user, 
                                           quiz_submission: quiz_submission, 
                                           current_score: 100)
        expect(quiz_category_rating.reload.score).to eq(60)
      end
    end
  end
end
