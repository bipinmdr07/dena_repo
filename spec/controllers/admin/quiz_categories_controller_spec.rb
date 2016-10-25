require 'rails_helper'

RSpec.describe Admin::QuizCategoriesController, type: :controller do
  describe "POST #create" do
    context "attributes are valid" do
      it "creates a new category" do
        admin = FactoryGirl.create(:user)

        sign_in admin
        expect {
          post :create, quiz_category: FactoryGirl.attributes_for(:quiz_category), format: :json
        }.to change(QuizCategory, :count).by(1)
      end
    end

    context "attributes are invalid" do
      it "does not create a new category" do
        admin = FactoryGirl.create(:user)

        sign_in admin
        expect {
          post :create, quiz_category: FactoryGirl.attributes_for(:quiz_category, name: nil), format: :json
        }.to change(QuizCategory, :count).by(0)

        expect(response.status).to eq(500)
        expect(JSON.parse(response.body)['errors'].length).to eq(1)
      end
    end
  end
end