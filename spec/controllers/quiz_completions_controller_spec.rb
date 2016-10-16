require 'rails_helper'

RSpec.describe QuizCompletionsController, type: :controller do
  describe "POST #create" do
    it "creates a new quiz completion" do
      user = FactoryGirl.create(:user)

      sign_in user

      expect {
        post :create, quiz_completion: { lesson_id: 1, course_name: "IntroLesson" }
      }.to change(QuizCompletion, :count).by(1)
    end
  end
end
