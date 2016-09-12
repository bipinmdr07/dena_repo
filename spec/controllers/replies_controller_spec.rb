require 'rails_helper'

RSpec.describe RepliesController, type: :controller do
  describe "POST #create" do
    context "when the attributes are valid" do
      it "creates a new question reply" do
        setup_question_by_current_user

        sign_in @user

        expect {
          post :create, question_id: @question.id, reply: FactoryGirl.attributes_for(:reply)
        }.to change(Reply, :count).by(1)
      end

      it "redirects the user to the question page" do
        setup_question_by_current_user

        sign_in @user
        post :create, question_id: @question.id, reply: FactoryGirl.attributes_for(:reply)
        
        expect(response).to redirect_to question_path(@question)
      end

      it "sends 2 emails" do
        setup_question_by_current_user

        sign_in @user

        expect {
          post :create, question_id: @question.id, reply: FactoryGirl.attributes_for(:reply)
        }.to change { ActionMailer::Base.deliveries.count }.by(2)
      end

      it "creates notification for involved users" do
        setup_question_by_current_user
        user_1 = FactoryGirl.create(:user)
        user_2 = FactoryGirl.create(:user)

        sign_in @user

        FactoryGirl.create(:reply, question_id: @question.id, user_id: user_1.id)
        FactoryGirl.create(:reply, question_id: @question.id, user_id: user_2.id)

        expect {
          post :create, question_id: @question.id, reply: FactoryGirl.attributes_for(:reply)
        }.to change(Notification, :count).by(2)
      end
    end

    context "when the attributes are invalid" do
      it "doesn't create a new question" do
        setup_question_by_current_user        

        sign_in @user

        expect {
          post :create, question_id: @question.id, 
          reply: FactoryGirl.attributes_for(:invalid_reply)
        }.to change(Reply, :count).by(0)
      end

      it "redirects the user to the new question page" do
       setup_question_by_current_user

        sign_in @user
        post :create, question_id: @question.id, 
          reply: FactoryGirl.attributes_for(:invalid_reply)

        expect(response).to redirect_to question_path(@question)
      end
    end
  end

  describe "GET #edit" do
    context "when the user is the person who created the post" do
      it "should render the edit template" do
        setup_question_by_current_user
        build_reply_by_current_user

        sign_in @user
        get :edit, question_id: @question.id, id: @reply.id

        expect(response).to render_template :edit
      end
    end

    context "when the user isn't the person who created the post" do
      it "should redirect to the question path" do
        setup_question_by_current_user
        build_reply_by_another_user

        sign_in @user
        get :edit, question_id: @question.id, id: @reply.id

        expect(response).to redirect_to question_path(@question)
      end
    end
  end

  describe "PUT #update" do
    context "when the user is person who created the post" do
      context "when the attributes are valid" do
        it "updates the post" do
          setup_question_by_current_user
          build_reply_by_current_user

          sign_in @user
          put :update, question_id: @question.id, 
                       id: @reply.id, 
                       reply: FactoryGirl.attributes_for(:reply, content: "New content!")
          @reply.reload

          expect(@reply.content).to eq("New content!")
        end

        it "redirects them to the question url" do
          setup_question_by_current_user
          build_reply_by_current_user

          sign_in @user
          put :update, question_id: @question.id, 
                       id: @reply.id, 
                       reply: FactoryGirl.attributes_for(:reply, content: "New content!")

          expect(response).to redirect_to question_path(@question)
        end
      end

      context "when the attributes are invalid" do
        it "doesn't update the post" do
          setup_question_by_current_user
          build_reply_by_current_user

          sign_in @user
          put :update, question_id: @question.id, 
                       id: @reply.id, 
                       reply: FactoryGirl.attributes_for(:reply, content: nil)
          @question.reload

          expect(@question.content).to eq("content")
        end

        it "renders the edit page" do
          setup_question_by_current_user
          build_reply_by_current_user

          sign_in @user
          put :update, question_id: @question.id, 
                       id: @reply.id, 
                       reply: FactoryGirl.attributes_for(:reply, content: nil)

          expect(response).to render_template :edit
        end
      end
    end

    context "when the user isn't person who created the post" do
      it "should redirect them to the question path" do
        setup_question_by_current_user
        build_reply_by_another_user

        sign_in @user
        put :update, question_id: @question.id, 
                     id: @reply.id, 
                     reply: FactoryGirl.attributes_for(:reply, content: "New content!")

        expect(response).to redirect_to question_path(@question)
      end
    end
  end

  describe "DELETE #destroy" do
    context "when the user is person who created the post" do
      it "should delete the post" do
        setup_question_by_current_user
        build_reply_by_current_user

        sign_in @user

        expect{
          delete :destroy, id: @reply.id
        }.to change(Reply, :count).by(-1)
      end

      it "should redirect the user to the original lesson url" do
        setup_question_by_current_user
        build_reply_by_current_user

        sign_in @user
        delete :destroy, id: @reply.id

        expect(response).to redirect_to question_path(@question)
      end
    end

    context "when the user isn't person who created the post" do
      it "should redirect them to the question path" do
        setup_question_by_current_user
        build_reply_by_another_user

        sign_in @user        
        delete :destroy, id: @reply.id

        expect(response).to redirect_to question_path(@question)
      end
    end
  end

  def setup_question_by_current_user
    @user = FactoryGirl.create(:user)
    @question = FactoryGirl.create(:question, user_id: @user.id)    
  end

  def build_reply_by_current_user
    @reply = FactoryGirl.create(:reply, question_id: @question.id, user_id: @user.id)
  end

  def build_reply_by_another_user
    @reply = FactoryGirl.create(:reply, question_id: @question.id, user_id: @user.id + 1)
  end
end


