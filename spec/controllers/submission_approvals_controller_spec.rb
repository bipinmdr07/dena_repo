require 'rails_helper'

RSpec.describe SubmissionApprovalsController, type: :controller do
  describe "POST #create" do
    context "user is an admin" do
      it "should change the submission to approved" do
        user = FactoryGirl.create(:admin_user)
        submission = FactoryGirl.create(:submission, approved: false, user_id: 1)
        sign_in user

        post :create, id: submission.id, format: :js
        submission.reload

        expect(submission.approved).to be(true)
      end

      it "creates notification for the user that submitted" do
        user = FactoryGirl.create(:admin_user)
        recipient = FactoryGirl.create(:user)        
        submission = FactoryGirl.create(:submission, approved: false, user_id: recipient.id)
        sign_in user

        expect {
          post :create, id: submission.id, format: :js
        }.to change(Notification, :count).by(1)
        expect(Notification.last.actor).to eq(user)
        expect(Notification.last.recipient).to eq(recipient)
      end
    end

    context "user is not an admin" do
      it "should not change the submission to approved" do
        user = FactoryGirl.create(:user)
        submission = FactoryGirl.create(:submission, approved: false, user_id: 1)

        post :create, id: submission.id, format: :js
        submission.reload
        
        expect(submission.approved).to be(false)
      end
    end
  end
end
