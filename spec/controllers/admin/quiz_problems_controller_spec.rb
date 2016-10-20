require 'rails_helper'

RSpec.describe Admin::QuizProblemsController, type: :controller do
  describe "#POST create" do
    context "user is admin" do
      context "attributes are valid" do
        it "creates a new quiz problem for the lesson" do
          admin = FactoryGirl.create(:admin_user)

          sign_in admin

          expect {
            post :create, quiz_problem: FactoryGirl.attributes_for(:quiz_problem).merge(mock_options), format: :json  
          }.to change(QuizProblem, :count).by(1)         
        end

        it "creates related quiz options" do
          admin = FactoryGirl.create(:admin_user)

          sign_in admin

          expect {
            post :create, quiz_problem: FactoryGirl.attributes_for(:quiz_problem).merge(mock_options), format: :json  
          }.to change(QuizOption, :count).by(4)   
        end

        it "returns the new quiz problem" do
          admin = FactoryGirl.create(:admin_user)

          sign_in admin
          post :create, quiz_problem: FactoryGirl.attributes_for(:quiz_problem).merge(mock_options), format: :json  

          expect(response.body).to eq(QuizProblem.last.to_json)
        end
      end

      context "there are no options" do
        it "does not create a new quiz problem" do
          admin = FactoryGirl.create(:admin_user)

          sign_in admin

          expect {
            post :create, quiz_problem: FactoryGirl.attributes_for(:quiz_problem), format: :json  
          }.to change(QuizProblem, :count).by(0)          
          expect(response.status).to eq(422)
          expect(JSON.parse(response.body)['errors'].length).to_not eq(0)
        end
      end

      context "there are less than 4 options" do
        it "does not create a new quiz problem" do
          admin = FactoryGirl.create(:admin_user)

          sign_in admin

          expect {
            post :create, quiz_problem: FactoryGirl.attributes_for(:quiz_problem).merge(mock_2_options), format: :json  
          }.to change(QuizProblem, :count).by(0)   
          expect(response.status).to eq(422)
          expect(JSON.parse(response.body)['errors'].length).to_not eq(0)
        end
      end

      context "there are no options with valid attributes" do
        it "does not create a new quiz problem" do
          admin = FactoryGirl.create(:admin_user)

          sign_in admin

          expect {
            post :create, quiz_problem: FactoryGirl.attributes_for(:quiz_problem).merge(mock_invalid_options), format: :json  
          }.to change(QuizProblem, :count).by(0)          
          expect(response.status).to eq(422)
          expect(JSON.parse(response.body)['errors'].length).to_not eq(0)
        end
      end

      context "attributes are invalid" do
        it "returns unprocessable entity" do
          admin = FactoryGirl.create(:admin_user)

          sign_in admin

          expect {
            post :create, quiz_problem: FactoryGirl.attributes_for(:quiz_problem, question: nil, lesson_id: nil, course_name: nil).merge(mock_options), format: :json  
          }.to change(QuizProblem, :count).by(0)
          expect(response.status).to eq(422)
          expect(JSON.parse(response.body)['errors'].length).to_not eq(0)
        end
      end
    end

    context "user is not admin" do
      it "redirects the user" do
        user = FactoryGirl.create(:user)

        sign_in user
        post :create, quiz_problem: FactoryGirl.attributes_for(:quiz_problem).merge(mock_options), format: :json  

        expect(response).to redirect_to dashboard_path
      end
    end
  end
end

def mock_2_options
  {options: [{content: 'content', correct: "incorrect"},
             {content: 'content', correct: "correct"}             
            ].to_json}
end

def mock_options
  {options: [{content: 'content', correct: "incorrect"},
             {content: 'content', correct: "incorrect"},
             {content: 'content', correct: "correct"},
             {content: 'content', correct: "incorrect"}
            ].to_json}
end

def mock_all_false_options
  {options: [{content: 'content', correct: "incorrect"},
             {content: 'content', correct: "incorrect"},
             {content: 'content', correct: "incorrect"},
             {content: 'content', correct: "incorrect"}
            ].to_json}
end

def mock_invalid_options
  {options: [{content: '', correct: "correct"},
             {content: '', correct: "incorrect"},
             {content: '', correct: "incorrect"},
             {content: '', correct: "incorrect"}
            ].to_json}
end







