require 'rails_helper'

RSpec.describe CoursesController, type: :controller do
  describe "GET #index" do
    context "user is logged in" do
      it "displays the index template" do
        user = FactoryGirl.create(:user)

        sign_in user
        get :index

        expect(response.status).to render_template :index
      end
    end
  end
end
