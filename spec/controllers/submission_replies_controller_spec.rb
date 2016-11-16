require 'rails_helper'

RSpec.describe SubmissionRepliesController, type: :controller do
  describe "POST #create" do
    context "when the attributes are valid" do
      it "creates a new submission reply" do
        setup_submission_by_current_user

        sign_in @user

        expect {
          post :create, submission_id: @submission.id, submission_reply: FactoryGirl.attributes_for(:submission_reply)
        }.to change(SubmissionReply, :count).by(1)
      end

      it "redirects the user to the submission page" do
        setup_submission_by_current_user

        sign_in @user
        post :create, submission_id: @submission.id, submission_reply: FactoryGirl.attributes_for(:submission_reply)

        expect(response).to redirect_to submission_path(@submission.id)
      end

      it "sends an email" do
        message_delivery = instance_double(ActionMailer::MessageDelivery)
        allow(UserMailer).to receive(:new_submission_reply).and_return(message_delivery)
        allow(message_delivery).to receive(:deliver_later)        
        setup_submission_by_current_user

        sign_in @user
        post :create, submission_id: @submission.id, submission_reply: FactoryGirl.attributes_for(:submission_reply)

        expect(UserMailer).to have_received(:new_submission_reply)
        expect(message_delivery).to have_received(:deliver_later)
      end

      it "creates notification for involved users" do
        setup_submission_by_current_user
        user_1 = FactoryGirl.create(:user)
        user_2 = FactoryGirl.create(:user)
        FactoryGirl.create(:submission_reply, submission_id: @submission.id, user_id: user_1.id)
        FactoryGirl.create(:submission_reply, submission_id: @submission.id, user_id: user_2.id)

        sign_in @user

        expect {
          post :create, submission_id: @submission.id, submission_reply: FactoryGirl.attributes_for(:submission_reply)
        }.to change(Notification, :count).by(2)
      end
    end

    context "when the attributes are invalid" do
      it "doesn't create a new submission" do
        setup_submission_by_current_user
        build_reply_by_current_user

        sign_in @user

        expect {
          post :create, submission_id: @submission.id,
          submission_reply: FactoryGirl.attributes_for(:invalid_submission_reply)
        }.to change(SubmissionReply, :count).by(0)
      end

      it "redirects the user to the new submission page" do
        setup_submission_by_current_user
        build_reply_by_current_user

        sign_in @user
        post :create, submission_id: @submission.id,
          submission_reply: FactoryGirl.attributes_for(:invalid_submission_reply)

        expect(response).to redirect_to submission_path(@submission.id)
      end
    end
  end

  describe "GET #edit" do
    context "when the user is the person who created the post" do
      it "should render the edit template" do
        setup_submission_by_current_user
        build_reply_by_current_user

        sign_in @user

        get :edit, submission_id: @submission.id, id: @reply.id
        expect(response).to render_template :edit
      end
    end

    context "when the user isn't the person who created the post" do
      it "should redirect to the submission path" do
        setup_submission_by_current_user
        build_reply_by_another_user

        sign_in @user

        get :edit, submission_id: @submission.id, id: @reply.id

        expect(response).to redirect_to submission_path(@submission)
      end
    end
  end

  describe "PUT #update" do
    context "when the user is person who created the post" do
      context "when the attributes are valid" do
        it "updates the post" do
          setup_submission_by_current_user
          build_reply_by_current_user

          sign_in @user
          put :update, submission_id: @submission.id, id: @reply.id,
                       submission_reply: FactoryGirl.attributes_for(:reply, content: "New content!")
          @reply.reload

          expect(@reply.content).to eq("New content!")
        end

        it "redirects them to the submission url" do
          setup_submission_by_current_user
          build_reply_by_current_user

          sign_in @user
          put :update, submission_id: @submission.id, id: @reply.id,
                       submission_reply: FactoryGirl.attributes_for(:reply, content: "New content!")

          expect(response).to redirect_to submission_path(@submission)
        end
      end

      context "when the attributes are invalid" do
        it "doesn't update the post" do
          setup_submission_by_current_user
          build_reply_by_current_user

          sign_in @user
          put :update, submission_id: @submission.id, id: @reply.id, submission_reply: FactoryGirl.attributes_for(:reply, content: nil)
          @reply.reload

          expect(@reply.content).to eq("content")
        end

        it "renders the edit page" do
          setup_submission_by_current_user
          build_reply_by_current_user

          sign_in @user

          put :update, submission_id: @submission.id, id: @reply.id, submission_reply: FactoryGirl.attributes_for(:reply, content: nil)
          expect(response).to render_template :edit
        end
      end
    end

    context "when the user isn't person who created the post" do
      it "should redirect them to the submission path" do
        setup_submission_by_current_user
        build_reply_by_another_user

        sign_in @user

        put :update, submission_id: @submission.id, id: @reply.id,
                     submission_reply: FactoryGirl.attributes_for(:reply, content: "New content!")

        expect(response).to redirect_to submission_path(@submission)
      end
    end
  end

  describe "DELETE #destroy" do
    context "when the user is person who created the post" do
      it "should delete the post" do
        setup_submission_by_current_user
        build_reply_by_current_user

        sign_in @user

        expect{
          delete :destroy, id: @reply.id
        }.to change(SubmissionReply, :count).by(-1)
      end

      it "should redirect the user to the original lesson url" do
        setup_submission_by_current_user
        build_reply_by_current_user

        sign_in @user
        delete :destroy, id: @reply.id

        expect(response).to redirect_to submission_path(@submission)
      end
    end

    context "when the user isn't person who created the post" do
      it "should redirect them to the submission path" do
        setup_submission_by_current_user
        build_reply_by_another_user

        sign_in @user
        delete :destroy, id: @reply.id

        expect(response).to redirect_to submission_path(@submission)
      end
    end
  end

  def setup_submission_by_current_user
    @user = FactoryGirl.create(:user)
    @submission = FactoryGirl.create(:submission, user_id: @user.id)
  end

  def build_reply_by_current_user
    @reply = FactoryGirl.create(:submission_reply, submission_id: @submission.id, user_id: @user.id)
  end

  def build_reply_by_another_user
    @reply = FactoryGirl.create(:submission_reply, submission_id: @submission.id, user_id: @user.id + 1)
  end
end
