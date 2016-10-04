require 'rails_helper'

RSpec.describe MenteesController, type: :controller do
  describe "GET #index" do

    context "when user is mentor" do
      it "should give 200 OK" do
        mentor = FactoryGirl.create(:mentor)

        sign_in mentor
        get :index

        expect(response).to render_template :index
      end
    end

    context "when user is not mentor" do
      it "should redirect to root_path" do
        user = FactoryGirl.create(:user)

        sign_in user
        get :index

        expect(response).to redirect_to root_path
      end
    end
  end
end
