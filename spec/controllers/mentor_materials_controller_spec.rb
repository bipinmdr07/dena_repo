require 'rails_helper'

RSpec.describe MentorMaterialsController, type: :controller do
  describe "GET #guidelines" do
    context "when user is a mentor" do
      it "should return 200 OK" do
        user = FactoryGirl.create(:user, mentor: true)
        sign_in user
        get :guidelines
        expect(response.status).to eq 200
      end
    end

    context "when user is a mentor" do
      it "should return 200 OK" do
        user = FactoryGirl.create(:user, mentor: false)
        sign_in user
        get :guidelines
        expect(response.status).to redirect_to root_path
      end
    end
  end

end
