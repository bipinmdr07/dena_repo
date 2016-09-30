require 'rails_helper'

RSpec.describe AdminDashboardController, type: :controller do
  describe "GET #index" do
    context "user is not admin" do
      it "should redirect user" do

        sign_in FactoryGirl.create(:user)
        get :index

        expect(response).to redirect_to dashboard_path
      end
    end

    context "user is admin" do
      it "should display index template" do
        sign_in FactoryGirl.create(:admin_user)
        get :index
        
        expect(response).to render_template :index
      end
    end
  end
end
