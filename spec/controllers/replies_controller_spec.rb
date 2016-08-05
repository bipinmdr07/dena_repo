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

  describe "GET #edit" do
    let(:user) { FactoryGirl.create(:user) }
    let(:question) { FactoryGirl.create(:question, user_id: user.id) }

    before :each do
      sign_in user
    end

    context "when the user is the person who created the post" do
      it "should render the edit template" do
        reply = FactoryGirl.create(:reply, question_id: question.id, user_id: user.id)
        get :edit, question_id: question.id, id: reply.id
        expect(response).to render_template :edit
      end
    end

    context "when the user isn't the person who created the post" do
      it "should redirect to the question path" do
        reply = FactoryGirl.create(:reply, question_id: question.id, user_id: user.id + 1)
        get :edit, question_id: question.id, id: reply.id
        expect(response).to redirect_to question_path(question)
      end
    end
  end

  describe "PUT #update" do
    let(:user) { FactoryGirl.create(:user) }
    let(:question) { FactoryGirl.create(:question, user_id: user.id) }

    before :each do
      sign_in user
    end

    context "when the user is person who created the post" do
      context "when the attributes are valid" do
        it "updates the post" do
          reply = FactoryGirl.create(:reply, question_id: question.id, user_id: user.id)
          put :update, question_id: question.id, 
                      id: reply.id, 
                      reply: FactoryGirl.attributes_for(:reply, content: "New content!")
          reply.reload
          expect(reply.content).to eq("New content!")
        end

        it "redirects them to the question url" do
          reply = FactoryGirl.create(:reply, question_id: question.id, user_id: user.id)
          put :update, question_id: question.id, 
                      id: reply.id, 
                      reply: FactoryGirl.attributes_for(:reply, content: "New content!")
          expect(response).to redirect_to question_path(question.id)
        end
      end

      context "when the attributes are invalid" do
        it "doesn't update the post" do
          reply = FactoryGirl.create(:reply, question_id: question.id, user_id: user.id)
          put :update, question_id: question.id, 
                      id: reply.id, 
                      reply: FactoryGirl.attributes_for(:reply, content: nil)
          question.reload
          expect(question.content).to eq("content")
        end

        it "renders the edit page" do
          reply = FactoryGirl.create(:reply, question_id: question.id, user_id: user.id)
          put :update, question_id: question.id, 
                      id: reply.id, 
                      reply: FactoryGirl.attributes_for(:reply, content: nil)
          expect(response).to render_template :edit
        end
      end
    end

    context "when the user isn't person who created the post" do
      it "should redirect them to the question path" do
        reply = FactoryGirl.create(:reply, question_id: question.id, user_id: user.id + 1)
        put :update, question_id: question.id, 
                      id: reply.id, 
                      reply: FactoryGirl.attributes_for(:reply, content: "New content!")
        expect(response).to redirect_to question_path(question)
      end
    end
  end

  describe "DELETE #destroy" do
    let(:user) { FactoryGirl.create(:user) }
    let(:question) { FactoryGirl.create(:question, user_id: user.id) }

    before :each do
      sign_in user
    end

    context "when the user is person who created the post" do
      it "should delete the post" do
        reply = FactoryGirl.create(:reply, question_id: question.id, user_id: user.id)
        expect{
          delete :destroy, question_id: question.id, id: reply.id
        }.to change(Reply, :count).by(-1)
      end

      it "should redirect the user to the original lesson url" do
        reply = FactoryGirl.create(:reply, question_id: question.id, user_id: user.id)
        delete :destroy, question_id: question.id, id: reply.id
        expect(response).to redirect_to question_path(question)
      end
    end

    context "when the user isn't person who created the post" do
      it "should redirect them to the question path" do
        reply = FactoryGirl.create(:reply, question_id: question.id, user_id: user.id + 1)
        delete :destroy, question_id: question.id, id: reply.id
        expect(response).to redirect_to question_path(question)
      end
    end
  end
end
