require 'rails_helper'

RSpec.describe Admin::QuizProblemsController, type: :controller do
  describe "#POST create" do
    context "user is admin" do
      context "attributes are valid" do
        it "creates a new quiz problem for the lesson" do
          admin = FactoryGirl.create(:admin_user)

          sign_in admin

          expect {
            post :create, quiz_problem: quiz_problem_with_4_options, format: :json  
          }.to change(QuizProblem, :count).by(1)         
        end

        it "creates related quiz options" do
          admin = FactoryGirl.create(:admin_user)

          sign_in admin

          expect {
            post :create, quiz_problem: quiz_problem_with_4_options, format: :json  
          }.to change(QuizOption, :count).by(4)   
        end

        it "returns the new quiz problem" do
          admin = FactoryGirl.create(:admin_user)

          sign_in admin
          post :create, quiz_problem: quiz_problem_with_4_options, format: :json  

          expect(response.body).to eq(QuizProblem.last.to_json)
        end
      end

      context "attributes are invalid" do
        it "returns unprocessable entity" do
          admin = FactoryGirl.create(:admin_user)

          sign_in admin

          expect {
            post :create, quiz_problem: FactoryGirl.attributes_for(:quiz_problem, question: nil, lesson_id: nil, course_name: nil), format: :json  
          }.to change(QuizProblem, :count).by(0)
          expect(response.body).to eq(:unprocessable_entity.to_json)
        end
      end
    end

    context "user is not admin" do
      it "redirects the user" do
        user = FactoryGirl.create(:user)

        sign_in user
        post :create, quiz_problem: quiz_problem_with_4_options, format: :json  

        expect(response).to redirect_to dashboard_path
      end
    end
  end
end

def quiz_problem_with_4_options
  FactoryGirl.attributes_for(:quiz_problem).merge(options: [FactoryGirl.attributes_for(:quiz_option), 
                                                            FactoryGirl.attributes_for(:quiz_option), 
                                                            FactoryGirl.attributes_for(:quiz_option), 
                                                            FactoryGirl.attributes_for(:quiz_option)])
end







