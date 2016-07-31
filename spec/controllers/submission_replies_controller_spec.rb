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

  describe "GET #edit" do
    let(:user) { FactoryGirl.create(:user) }
    let(:submission) { FactoryGirl.create(:submission, user_id: user.id) }

    before :each do
      sign_in user
    end

    context "when the user is the person who created the post" do
      it "should render the edit template" do
        reply = FactoryGirl.create(:submission_reply, submission_id: submission.id, user_id: user.id)
        get :edit, submission_id: submission.id, id: reply.id
        expect(response).to render_template :edit
      end
    end

    context "when the user isn't the person who created the post" do
      it "should redirect to the submission path" do
        reply = FactoryGirl.create(:submission_reply, submission_id: submission.id, user_id: user.id + 1)
        get :edit, submission_id: submission.id, id: reply.id
        expect(response).to redirect_to submission_path(submission)
      end
    end
  end

  describe "PUT #update" do
    let(:user) { FactoryGirl.create(:user) }
    let(:submission) { FactoryGirl.create(:submission, user_id: user.id) }

    before :each do
      sign_in user
    end

    context "when the user is person who created the post" do
      context "when the attributes are valid" do
        it "updates the post" do
          reply = FactoryGirl.create(:submission_reply, submission_id: submission.id, user_id: user.id)
          put :update, submission_id: submission.id, 
                      id: reply.id, 
                      submission_reply: FactoryGirl.attributes_for(:reply, content: "New content!")
          reply.reload
          expect(reply.content).to eq("New content!")
        end

        it "redirects them to the submission url" do
          reply = FactoryGirl.create(:submission_reply, submission_id: submission.id, user_id: user.id)
          put :update, submission_id: submission.id, 
                      id: reply.id, 
                      submission_reply: FactoryGirl.attributes_for(:reply, content: "New content!")
          expect(response).to redirect_to submission_path(submission)
        end
      end

      context "when the attributes are invalid" do
        it "doesn't update the post" do
          reply = FactoryGirl.create(:submission_reply, submission_id: submission.id, user_id: user.id)
          put :update, submission_id: submission.id, 
                      id: reply.id, 
                      submission_reply: FactoryGirl.attributes_for(:reply, content: nil)
          submission.reload
          expect(submission.content).to eq("content")
        end

        it "renders the edit page" do
          reply = FactoryGirl.create(:submission_reply, submission_id: submission.id, user_id: user.id)
          put :update, submission_id: submission.id, 
                      id: reply.id, 
                      submission_reply: FactoryGirl.attributes_for(:reply, content: nil)
          expect(response).to render_template :edit
        end
      end
    end

    context "when the user isn't person who created the post" do
      it "should redirect them to the submission path" do
        reply = FactoryGirl.create(:submission_reply, submission_id: submission.id, user_id: user.id + 1)
        put :update, submission_id: submission.id, 
                      id: reply.id, 
                      submission_reply: FactoryGirl.attributes_for(:reply, content: "New content!")
        expect(response).to redirect_to submission_path(submission)
      end
    end
  end

  describe "DELETE #destroy" do
    let(:user) { FactoryGirl.create(:user) }
    let(:submission) { FactoryGirl.create(:submission, user_id: user.id) }

    before :each do
      sign_in user
    end

    context "when the user is person who created the post" do
      it "should delete the post" do
        reply = FactoryGirl.create(:submission_reply, submission_id: submission.id, user_id: user.id)
        expect{
          delete :destroy, submission_id: submission.id, id: reply.id
        }.to change(SubmissionReply, :count).by(-1)
      end

      it "should redirect the user to the original lesson url" do
        reply = FactoryGirl.create(:submission_reply, submission_id: submission.id, user_id: user.id)
        delete :destroy, submission_id: submission.id, id: reply.id
        expect(response).to redirect_to submission_path(submission)
      end
    end

    context "when the user isn't person who created the post" do
      it "should redirect them to the submission path" do
        reply = FactoryGirl.create(:submission_reply, submission_id: submission.id, user_id: user.id + 1)
        delete :destroy, submission_id: submission.id, id: reply.id
        expect(response).to redirect_to submission_path(submission)
      end
    end
  end
end