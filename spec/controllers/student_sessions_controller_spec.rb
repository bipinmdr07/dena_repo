require 'rails_helper'

RSpec.describe StudentSessionsController, type: :controller do
  let(:mentor) { FactoryGirl.create(:mentor) }
  # let(:user) { FactoryGirl.create(:user, mentor_id: mentor.id) }
  #
  # before :each do
  #   sign_in user
  # end

  describe "GET #index" do
    context "when user is signed in" do
      it "should render index" do
        user = FactoryGirl.create(:user, mentor_id: mentor.id)
        sign_in user

        get :index

        expect(response).to render_template :index
      end
    end
  end

  describe "GET #new" do
    it "should render new template" do
      user = FactoryGirl.create(:user, mentor_id: mentor.id)
      sign_in user

      get :new

      expect(response).to render_template :new
    end
  end

  describe "POST #create" do
    context "when attributes are valid" do
      it "should create a new mentor session" do
        user = FactoryGirl.create(:user, mentor_id: mentor.id)
        sign_in user

        mentor_session = FactoryGirl.create(:mentor_session, user_id: user.id, mentor_id: mentor.id)

        expect{
          post :create, student_session: FactoryGirl.attributes_for(:student_session, user_id: user.id, mentor_id: mentor.id, mentor_session_id: mentor_session.id)
        }.to change(StudentSession, :count).by(1)
      end
    end

    context "when attributes are invalid" do
      it "shouldn't create a new mentor session" do
        user = FactoryGirl.create(:user, mentor_id: mentor.id)
        sign_in user

        mentor_session = FactoryGirl.create(:mentor_session, user_id: user.id, mentor_id: mentor.id)

        expect{
          post :create, student_session: FactoryGirl.attributes_for(:invalid_student_session, mentor_session_id: mentor_session.id)
        }.to change(StudentSession, :count).by(0)
      end
    end
  end
end

# def setup_user
#
# end
