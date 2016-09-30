require 'rails_helper'

RSpec.describe MenteesController, type: :controller do
  describe "GET #index" do
    let(:user) { FactoryGirl.create(:user) }
    let(:mentor) { FactoryGirl.create(:mentor) }

    context "when user is mentor" do
      it "should give 200 OK" do
        sign_in mentor
        get :index

        expect(response).to render_template :index
      end
    end

    context "when user is not mentor" do
      it "should redirect to root_path" do
        sign_in user
        get :index

        expect(response).to redirect_to root_path
      end
    end
  end
end
