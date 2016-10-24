require 'rails_helper'

RSpec.describe Admin::QuizOptionsController, type: :controller do
  describe "PATCH #update" do
    context "attributes are valid" do
      it "updates the option" do
        admin = FactoryGirl.create(:admin_user)
        quiz_problem = FactoryGirl.create(:quiz_problem)
        quiz_option = FactoryGirl.create(:quiz_option, quiz_problem: quiz_problem)

        sign_in admin
        patch :update, id: quiz_option.id, quiz_option: { content: 'Hello' }, format: :json
        quiz_option.reload

        expect(quiz_option.content).to eq("Hello")
        expect(response.body).to eq(quiz_option.content.to_json)
      end
    end

    context "attributes are not valid" do
      it "does not update the option" do
        admin = FactoryGirl.create(:admin_user)
        quiz_problem = FactoryGirl.create(:quiz_problem)
        quiz_option = FactoryGirl.create(:quiz_option, quiz_problem: quiz_problem, content: 'This is an option')

        sign_in admin
        patch :update, id: quiz_option.id, quiz_option: { content: nil }, format: :json
        quiz_option.reload

        expect(quiz_option.content).to eq("This is an option")
        expect(response.status).to eq(422)
        expect(JSON.parse(response.body)['errors'].length).to_not eq(0)
      end
    end
  end
end
