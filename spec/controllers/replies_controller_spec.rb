require 'rails_helper'

RSpec.describe RepliesController, type: :controller do
  describe "POST #create" do
    let(:user) { FactoryGirl.create(:user) }
    let(:question) { FactoryGirl.create(:question, user_id: user.id) }

    context "when the attributes are valid" do
      before :each do
        sign_in user
      end
      
      it "creates a new question reply" do
        expect {
          post :create, question_id: question.id, reply: FactoryGirl.attributes_for(:reply)
        }.to change(Reply, :count).by(1)
      end

      it "redirects the user to the question page" do
        post :create, question_id: question.id, reply: FactoryGirl.attributes_for(:reply)
        expect(response).to redirect_to question_path(question.id)
      end

      it "sends 2 emails" do
        expect {
          post :create, question_id: question.id, reply: FactoryGirl.attributes_for(:reply)
        }.to change { ActionMailer::Base.deliveries.count }.by(2)
      end
    end

    context "when the attributes are invalid" do
      before :each do
        sign_in user
      end

      it "doesn't create a new question" do
        expect {
          post :create, question_id: question.id, 
          reply: FactoryGirl.attributes_for(:invalid_reply)
        }.to change(Reply, :count).by(0)
      end

      it "redirects the user to the new question page" do
        post :create, question_id: question.id, 
          reply: FactoryGirl.attributes_for(:invalid_reply)
        expect(response).to redirect_to question_path(question.id)
      end
    end

  end
end
