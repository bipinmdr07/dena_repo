require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
  describe "POST #create" do
    context "when the attributes are valid" do
      before :each do
        sign_in FactoryGirl.create(:user)
      end
      
      it "creates a new question" do
        expect {
          post :create, question: FactoryGirl.attributes_for(:question)
        }.to change(Question, :count).by(1)
      end

      it "redirects the user to the created question page" do
        post :create, question: FactoryGirl.attributes_for(:question)
        expect(response).to redirect_to question_path(Question.last.id)
      end

      it "sends an email to the user" do
        expect {
          post :create, question: FactoryGirl.attributes_for(:question)
        }.to change { ActionMailer::Base.deliveries.count }.by(1)
      end
    end

    context "when the attributes are invalid" do
      before :each do
        sign_in FactoryGirl.create(:user)
      end

      it "doesn't create a new question" do
        expect {
          post :create, question: FactoryGirl.attributes_for(:invalid_question)
        }.to change(Question, :count).by(0)
      end

      it "redirects the user to the new question page" do
        post :create, question: FactoryGirl.attributes_for(:invalid_question)
        expect(response).to redirect_to new_question_path(course_name: 'HtmlCssLesson', lesson_id: 1)
      end
    end
  end
end
