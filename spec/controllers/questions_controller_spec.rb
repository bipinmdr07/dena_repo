require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
  describe "POST #create" do
    context "when the attributes are valid" do
      before :each do
        sign_in FactoryGirl.create(:user)
      end
      
      it "creates a new question" do
        expect {
          post :create, question: FactoryGirl.attributes_for(:question)
        }.to change(Question, :count).by(1)
      end

      it "redirects the user to the created question page" do
        post :create, question: FactoryGirl.attributes_for(:question)
        expect(response).to redirect_to question_path(Question.last.id)
      end

      it "sends an email to the user" do
        expect {
          post :create, question: FactoryGirl.attributes_for(:question)
        }.to change { ActionMailer::Base.deliveries.count }.by(1)
      end
    end

    context "when the attributes are invalid" do
      before :each do
        sign_in FactoryGirl.create(:user)
      end

      it "doesn't create a new question" do
        expect {
          post :create, question: FactoryGirl.attributes_for(:invalid_question)
        }.to change(Question, :count).by(0)
      end

      it "redirects the user to the new question page" do
        post :create, question: FactoryGirl.attributes_for(:invalid_question)
        expect(response).to redirect_to new_question_path(course_name: 'HtmlCssLesson', lesson_id: 1)
      end
    end

    context "when user is a mentor" do
      before :each do
        sign_in FactoryGirl.create(:user, mentor: true)
      end

      it "creates a new question" do
        expect {
          post :create, question: FactoryGirl.attributes_for(:question)
        }.to change(Question, :count).by(1)
      end

      it "redirects the user to the created question page" do
        post :create, question: FactoryGirl.attributes_for(:question)
        expect(response).to redirect_to question_path(Question.last.id)
      end

      it "sends an email to the user" do
        expect {
          post :create, question: FactoryGirl.attributes_for(:question)
        }.to change { ActionMailer::Base.deliveries.count }.by(1)
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
        question = FactoryGirl.create(:question, user_id: user.id)
        get :edit, id: question.id
        expect(response).to render_template :edit
      end
    end

    context "when the post is a mentor_post" do
      it "should render the edit template" do
        question = FactoryGirl.create(:mentor_post, user_id: user.id)
        get :edit, id: question.id
        expect(response).to render_template :edit
      end
    end

    context "when the user isn't the person who created the post" do
      it "should redirect to the question path" do
        another_user = FactoryGirl.create(:user)
        question = FactoryGirl.create(:question, user_id: another_user.id)
        get :edit, id: question.id
        expect(response).to redirect_to question_path(question)
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
          question = FactoryGirl.create(:question, user_id: user.id)
          put :update, id: question.id, question: FactoryGirl.attributes_for(:question, title: "New Title!")
          question.reload
          expect(question.title).to eq("New Title!")
        end

        it "redirects them to the question url" do
          question = FactoryGirl.create(:question, user_id: user.id)
          put :update, id: question.id, question: FactoryGirl.attributes_for(:question, title: "New Title!")
          expect(response).to redirect_to question_path(question)
        end
      end

      context "when the attributes are invalid" do
        it "doesn't update the post" do
          question = FactoryGirl.create(:question, user_id: user.id)
          put :update, id: question.id, question: FactoryGirl.attributes_for(:question, title: nil, content: "New content")
          question.reload
          expect(question.content).to_not eq("New content")
        end

        it "renders the edit page" do
          question = FactoryGirl.create(:question, user_id: user.id)
          put :update, id: question.id, question: FactoryGirl.attributes_for(:question, title: nil, content: "New content")
          expect(response).to render_template :edit
        end
      end
    end

    context "when the post is a mentor_post" do
      context "when the attributes are valid" do
        it "updates the post" do
          question = FactoryGirl.create(:mentor_post, user_id: user.id)
          put :update, id: question.id, question: FactoryGirl.attributes_for(:question, title: "New Title!")
          question.reload
          expect(question.title).to eq("New Title!")
        end

        it "redirects them to the question url" do
          question = FactoryGirl.create(:mentor_post, user_id: user.id)
          put :update, id: question.id, question: FactoryGirl.attributes_for(:question, title: "New Title!")
          expect(response).to redirect_to question_path(question)
        end
      end

      context "when the attributes are invalid" do
        it "doesn't update the post" do
          question = FactoryGirl.create(:mentor_post, user_id: user.id)
          put :update, id: question.id, question: FactoryGirl.attributes_for(:question, title: nil, content: "New content")
          question.reload
          expect(question.content).to_not eq("New content")
        end

        it "renders the edit page" do
          question = FactoryGirl.create(:mentor_post, user_id: user.id)
          put :update, id: question.id, question: FactoryGirl.attributes_for(:question, title: nil, content: "New content")
          expect(response).to render_template :edit
        end
      end
    end

    context "when the user isn't person who created the post" do
      it "should redirect them to the question path" do
        another_user = FactoryGirl.create(:user)
        question = FactoryGirl.create(:question, user_id: another_user.id)
        put :update, id: question.id, question:FactoryGirl.attributes_for(:question, content: "New content")
        expect(response).to redirect_to question_path(question)
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
        question = FactoryGirl.create(:question, user_id: user.id)
        expect{
          delete :destroy, id: question.id
        }.to change(Question, :count).by(-1)
      end

      it "should redirect the user to the original lesson url" do
        question = FactoryGirl.create(:question, user_id: user.id)
        delete :destroy, id: question.id
        expect(response).to redirect_to "/html_css_lessons/1"
      end
    end

    context "when the user isn't person who created the post" do
      it "should redirect them to the question path" do
        another_user = FactoryGirl.create(:user)
        question = FactoryGirl.create(:question, user_id: another_user.id)
        delete :destroy, id: question.id
        expect(response).to redirect_to question_path(question)
      end
    end
  end
end
