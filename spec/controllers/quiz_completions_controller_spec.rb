require 'rails_helper'

RSpec.describe QuizCompletionsController, type: :controller do
  describe "POST #create" do
    context "quiz for current lesson has not been completed" do
      it "creates a new quiz completion" do
        user = FactoryGirl.create(:user)

        sign_in user

        expect {
          post :create, quiz_completion: { lesson_id: 1, course_name: "IntroLesson" }, format: :json
        }.to change(QuizCompletion, :count).by(1)
      end
    end

    context "quiz for current lesson has been completed" do
      it "does not create new quiz completion" do
        user = FactoryGirl.create(:user)
        quiz_completion = FactoryGirl.create(:quiz_completion, lesson_id: 1, course_name: "IntroLesson", user_id: user.id)
        
        sign_in user

        expect {
          post :create, quiz_completion: { lesson_id: 1, course_name: "IntroLesson" }, format: :json
        }.to change(QuizCompletion, :count).by(0)
      end
    end
  end
end
