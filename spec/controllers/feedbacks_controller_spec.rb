require 'rails_helper'

RSpec.describe FeedbacksController, type: :controller do

  describe "GET #index" do
    context "User is an admin" do
      it "return true" do
        sign_in FactoryGirl.create(:admin_user)
      end
    end

    context "User is a student" do
      it "return false" do

      end
    end
  end
  
end
