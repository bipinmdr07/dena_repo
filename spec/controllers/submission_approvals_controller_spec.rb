require 'rails_helper'

RSpec.describe SubmissionApprovalsController, type: :controller do
  describe "POST #create" do
    context "user is a mentor" do
      it "should change the submission to approved" do
        mentor = FactoryGirl.create(:mentor)
        user = FactoryGirl.create(:user)

        submission = FactoryGirl.create(:submission, approved: false, user_id: user.id)

        sign_in mentor
        post :create, id: submission.id, format: :json
        submission.reload

        expect(submission.approved).to be(true)
      end

      it "creates notification for the user that submitted" do
        user = FactoryGirl.create(:mentor)
        recipient = FactoryGirl.create(:user)
        submission = FactoryGirl.create(:submission, approved: false, user_id: recipient.id)

        sign_in user

        expect {
          post :create, id: submission.id, format: :json
        }.to change(Notification, :count).by(1)
        expect(Notification.last.actor).to eq(user)
        expect(Notification.last.recipient).to eq(recipient)
      end
    end

    context "user is not a mentor" do
      it "should not change the submission to approved" do
        user = FactoryGirl.create(:user)
        user_2 = FactoryGirl.create(:user)
        submission = FactoryGirl.create(:submission, approved: false, user_id: user_2.id)

        sign_in user
        post :create, id: submission.id, format: :json
        submission.reload

        expect(submission.approved).to be(false)
      end
    end
  end
end
