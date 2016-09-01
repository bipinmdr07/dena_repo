require 'rails_helper'

RSpec.describe MentorSessionsController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }
  let(:mentor) { FactoryGirl.create(:mentor) }

  before :each do
    sign_in mentor
  end

  describe "GET #index" do
    context "when user is mentor" do
      it "should give 200 OK" do
        get :index, mentee_id: user.id
        expect(response).to render_template :index
      end
    end

    context "when user is not mentor" do
      it "should redirect to root_path" do
        sign_in user
        get :index, mentee_id: user.id
        expect(response).to redirect_to root_path
      end
    end
  end

  # describe "GET #show" do
  #   it "should render show template" do
  #     get :show
  #     expect(response).to render_template :show
  #   end
  # end

  describe "GET #new" do
    it "should render new template" do
      get :new, mentee_id: user.id
      expect(response).to render_template :new
    end
  end

  describe "POST #create" do
    context "when attributes are valid" do
      it "should create a new mentor session" do
        expect{
          post :create, mentee_id: user.id, mentor_session: FactoryGirl.attributes_for(:mentor_session, user_id: user.id)
        }.to change(MentorSession, :count).by(1)
      end
    end

    context "when attributes are invalid" do
      it "shouldn't create a new mentor session" do
        expect{
          post :create, mentee_id: user.id, mentor_session: FactoryGirl.attributes_for(:invalid_mentor_session, user_id: user.id)
        }.to change(MentorSession, :count).by(0)
      end
    end
  end

  describe "PATCH #update" do
    context "when attributes are valid" do
      it "should update a mentor session" do
          mentor_session = FactoryGirl.create(:mentor_session, user_id: user.id, mentor_id: mentor.id)
          patch :update, mentee_id: user.id, mentor_session: FactoryGirl.attributes_for(:mentor_session, private_details: "Change to this"), id: mentor_session.id
          mentor_session.reload
          expect(mentor_session.private_details).to eq("Change to this")
      end
    end

    context "when attributes are invalid" do
      it "should update a mentor session" do
          mentor_session = FactoryGirl.create(:mentor_session, user_id: user.id, mentor_id: mentor.id)
          patch :update, mentee_id: user.id, mentor_session: FactoryGirl.attributes_for(:mentor_session, public_details: ""), id: mentor_session.id
          mentor_session.reload
          expect(mentor_session.public_details).to_not eq("")
      end
    end

  end


end
