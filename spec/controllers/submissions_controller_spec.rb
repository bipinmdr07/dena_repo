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

  describe "GET #edit" do
    let(:user) { FactoryGirl.create(:user) }
    before :each do
      sign_in user
    end

    context "when the user is the person who created the post" do
      it "should render the edit template" do
        submission = FactoryGirl.create(:submission, user_id: user.id)

        get :edit, id: submission.id

        expect(response).to render_template :edit
      end
    end

    context "when the user isn't the person who created the post" do
      it "should redirect to the submission path" do
        submission = FactoryGirl.create(:submission, user_id: user.id + 1)

        get :edit, id: submission.id

        expect(response).to redirect_to submission_path(submission)
      end
    end
  end

  describe "PUT #update" do
    let(:user) { FactoryGirl.create(:user) }
    before :each do
      sign_in user
    end

    context "when the user is person who created the post" do
      context "when the attributes are valid" do
        it "updates the post" do
          submission = FactoryGirl.create(:submission, user_id: user.id)

          put :update, id: submission.id, submission: FactoryGirl.attributes_for(:submission, title: "New Title!")
          submission.reload

          expect(submission.title).to eq("New Title!")
        end

        it "redirects them to the submission url" do
          submission = FactoryGirl.create(:submission, user_id: user.id)

          put :update, id: submission.id, submission: FactoryGirl.attributes_for(:submission, title: "New Title!")

          expect(response).to redirect_to submission_path(submission)
        end
      end

      context "when the attributes are invalid" do
        it "doesn't update the post" do
          submission = FactoryGirl.create(:submission, user_id: user.id)

          put :update, id: submission.id, submission: FactoryGirl.attributes_for(:submission, title: nil, content: "New content")
          submission.reload

          expect(submission.content).to_not eq("New content")
        end

        it "renders the edit page" do
          submission = FactoryGirl.create(:submission, user_id: user.id)

          put :update, id: submission.id, submission: FactoryGirl.attributes_for(:submission, title: nil, content: "New content")

          expect(response).to render_template :edit
        end
      end
    end

    context "when the user isn't person who created the post" do
      it "should redirect them to the submission path" do
        submission = FactoryGirl.create(:submission, user_id: user.id + 1)

        put :update, id: submission.id, submission:FactoryGirl.attributes_for(:submission, content: "New content")

        expect(response).to redirect_to submission_path(submission)
      end
    end
  end

  describe "DELETE #destroy" do
    let(:user) { FactoryGirl.create(:user) }
    before :each do
      sign_in user
    end

    context "when the user is person who created the post" do
      it "should delete the post" do
        submission = FactoryGirl.create(:submission, user_id: user.id)

        expect{
          delete :destroy, id: submission.id
        }.to change(Submission, :count).by(-1)
      end

      it "should redirect the user to the original lesson url" do
        submission = FactoryGirl.create(:submission, user_id: user.id)

        delete :destroy, id: submission.id

        expect(response).to redirect_to "/html_css_lessons/1"
      end
    end

    context "when the user isn't person who created the post" do
      it "should redirect them to the submission path" do
        submission = FactoryGirl.create(:submission, user_id: user.id + 1)

        delete :destroy, id: submission.id

        expect(response).to redirect_to submission_path(submission)
      end
    end
  end
end
