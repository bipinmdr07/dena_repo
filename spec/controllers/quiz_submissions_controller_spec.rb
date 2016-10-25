require 'rails_helper'

RSpec.describe QuizSubmissionsController, type: :controller do
  describe "POST #create" do
    context "attributes are valid" do
      it "creates a new submission" do
        user = FactoryGirl.create(:user)
        quiz_problem = FactoryGirl.create(:quiz_problem)
        calculator = double("calculator")   
        allow_any_instance_of(QuizSubmission).to receive(:calculate_score).and_return(100)
        allow(QuizCategoryRating).to receive(:create_or_rank!)
        allow(QuizQualityResponseCalculator).to receive(:new).and_return(calculator)
        allow(calculator).to receive(:calculate!).and_return(100)

        sign_in user
        
        expect{
          post :create, quiz_submission: { quiz_problem_id: quiz_problem.id, checked_option_ids: [1, 2]}, format: :json
        }.to change(QuizSubmission, :count).by(1)
        expect(JSON.parse(response.body)['score']).to eq(100)
        expect(QuizCategoryRating).to have_received(:create_or_rank!)
        expect(QuizQualityResponseCalculator).to have_received(:new)
        expect(calculator).to have_received(:calculate!)
      end

      it "creates a new quiz_problem_card if it doesn't exist" do
        user = FactoryGirl.create(:user)
        quiz_problem = FactoryGirl.create(:quiz_problem)
        calculator = double("calculator")   
        allow_any_instance_of(QuizSubmission).to receive(:calculate_score).and_return(100)
        allow(QuizCategoryRating).to receive(:create_or_rank!)
        allow(QuizQualityResponseCalculator).to receive(:new).and_return(calculator)
        allow(calculator).to receive(:calculate!).and_return(100)

        sign_in user

        expect{
          post :create, quiz_submission: { quiz_problem_id: quiz_problem.id, checked_option_ids: [1, 2]}, format: :json
        }.to change(QuizProblemCard, :count).by(1)
        expect(QuizCategoryRating).to have_received(:create_or_rank!)
        expect(QuizQualityResponseCalculator).to have_received(:new)
        expect(calculator).to have_received(:calculate!)
      end

      it "doesn't create a new quiz_problem_card if it already exists" do
        user = FactoryGirl.create(:user)
        quiz_problem = FactoryGirl.create(:quiz_problem)
        quiz_problem_card = FactoryGirl.create(:quiz_problem_card, user: user, quiz_problem: quiz_problem)
        calculator = double("calculator")   
        allow_any_instance_of(QuizSubmission).to receive(:calculate_score).and_return(100)
        allow(QuizCategoryRating).to receive(:create_or_rank!)
        allow(QuizQualityResponseCalculator).to receive(:new).and_return(calculator)
        allow(calculator).to receive(:calculate!).and_return(100)

        sign_in user

        expect{
          post :create, quiz_submission: { quiz_problem_id: quiz_problem.id, checked_option_ids: [1, 2]}, format: :json
        }.to change(QuizProblemCard, :count).by(0)
        expect(QuizCategoryRating).to have_received(:create_or_rank!)
        expect(QuizQualityResponseCalculator).to have_received(:new)
        expect(calculator).to have_received(:calculate!)
      end
    end
    context "attributes are invalid" do
      it "returns unprocessable_entity" do
        user = FactoryGirl.create(:user)
        quiz_problem = FactoryGirl.create(:quiz_problem)

        sign_in user

        expect(QuizCategoryRating).to_not receive(:create_or_rank!)
        post :create, quiz_submission: { quiz_problem_id: nil, checked_option_ids: nil}, format: :json

        expect(response.status).to eq(422)
      end
    end
  end
end