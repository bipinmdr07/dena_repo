require 'rails_helper'

RSpec.describe FeedbacksController, type: :controller do
  let(:admin_user) { FactoryGirl.create(:admin_user) }
  let(:user) { FactoryGirl.create(:user) }
  # let(:feedback) { FactoryGirl.create(:feedback, user_id: user.id) }

  describe "GET #index" do
    context "User is an admin" do
      it "renders index template" do
        sign_in admin_user
        get :index
        expect(response).to render_template(:index)
      end
    end

    context "User is a student" do
      it "return false" do
        sign_in user
        get :index
        expect(response).to redirect_to dashboard_path
      end
    end
  end

  describe "POST #create" do
    before :each do
      sign_in user
    end
    context "attributes are valid" do
      it "should create a feedback" do
        expect{
          post :create, feedback: FactoryGirl.attributes_for(:feedback, user_id: user.id)
        }.to change(Feedback, :count).by 1
        expect(response).to redirect_to "/html_css_lessons/1"
      end
    end

    context "attributes are invalid" do
      it "shouldn't create a feedback" do
          expect{
            post :create, feedback: FactoryGirl.attributes_for(:invalid_feedback, user_id: user.id)
          }.to change(Feedback, :count).by 0
      end
    end
  end

  describe "GET #show" do
      it "should render show page" do
        feedback = FactoryGirl.create(:feedback, user_id: user.id)
        expect{
          get :show, id: feedback.id
        }.to render_template(:show)
      end
  end

  describe "DELETE #destroy" do
    context "user is admin" do
      it "deletes the feedback" do
        sign_in admin_user
        feedback = FactoryGirl.create(:feedback, user_id: user.id)
        expect{
          delete :destroy, id: feedback.id
        }.to change(Feedback, :count).by (-1)
        expect(response).to redirect_to dashboard_path
      end
    end

    context "user is student" do
      it "shouldn't delete the feedback" do
        sign_in user
        feedback = FactoryGirl.create(:feedback, user_id: user.id)
        expect{
          delete :destroy, {id: feedback.to_param}
        }.to change(Feedback, :count).by (0)
        expect(response).to redirect_to dashboard_path
      end
    end
  end
end
