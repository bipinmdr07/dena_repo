require 'rails_helper'

RSpec.describe QuestionDownvotesController, type: :controller do

  describe "POST #create" do
    context "when user is signed in" do
      it "should increment upvotes by 1" do
        user = FactoryGirl.create(:user)
        question = FactoryGirl.create(:question, user_id: user.id)

        sign_in user
        post :create, id: question.id, format: :js

        expect(question.get_downvotes.size).to eq(1)
      end
    end
  end
end
