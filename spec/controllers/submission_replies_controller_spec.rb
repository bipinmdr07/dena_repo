require 'rails_helper'

RSpec.describe SubmissionRepliesController, type: :controller do
  describe "POST #create" do
    let(:user) { FactoryGirl.create(:user) }
    let(:submission) { FactoryGirl.create(:submission, user_id: user.id) }

    context "when the attributes are valid" do
      before :each do
        sign_in user
      end
      
      it "creates a new submission reply" do
        expect {
          post :create, submission_id: submission.id, submission_reply: FactoryGirl.attributes_for(:submission_reply)
        }.to change(SubmissionReply, :count).by(1)
      end

      it "redirects the user to the submission page" do
        post :create, submission_id: submission.id, submission_reply: FactoryGirl.attributes_for(:submission_reply)
        expect(response).to redirect_to submission_path(submission.id)
      end

      it "sends 2 emails" do
        expect {
          post :create, submission_id: submission.id, submission_reply: FactoryGirl.attributes_for(:submission_reply)
        }.to change { ActionMailer::Base.deliveries.count }.by(2)
      end
    end

    context "when the attributes are invalid" do
      before :each do
        sign_in user
      end

      it "doesn't create a new submission" do
        expect {
          post :create, submission_id: submission.id, 
          submission_reply: FactoryGirl.attributes_for(:invalid_submission_reply)
        }.to change(SubmissionReply, :count).by(0)
      end

      it "redirects the user to the new submission page" do
        post :create, submission_id: submission.id, 
          submission_reply: FactoryGirl.attributes_for(:invalid_submission_reply)
        expect(response).to redirect_to submission_path(submission.id)
      end
    end

  end
end
