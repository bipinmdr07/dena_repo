require 'rails_helper'

RSpec.describe SubmissionsController, type: :controller do
  describe "POST #create" do
    context "when the attributes are valid" do
      before :each do
        sign_in FactoryGirl.create(:user)
      end
      
      it "creates a new submission" do
        expect {
          post :create, submission: FactoryGirl.attributes_for(:submission)
        }.to change(Submission, :count).by(1)
      end

      it "redirects the user to the created submission page" do
        post :create, submission: FactoryGirl.attributes_for(:submission)
        expect(response).to redirect_to submission_path(Submission.last.id)
      end

      it "sends an email to the user" do
        expect {
          post :create, submission: FactoryGirl.attributes_for(:submission)
        }.to change { ActionMailer::Base.deliveries.count }.by(1)
      end
    end

    context "when the attributes are invalid" do
      before :each do
        sign_in FactoryGirl.create(:user)
      end

      it "doesn't create a new submission" do
        expect {
          post :create, submission: FactoryGirl.attributes_for(:invalid_submission)
        }.to change(Submission, :count).by(0)
      end

      it "redirects the user to the new submission page" do
        post :create, submission: FactoryGirl.attributes_for(:invalid_submission)
        expect(response).to redirect_to new_submission_path(course_name: 'HtmlCssLesson', lesson_id: 1)
      end
    end
  end
end
