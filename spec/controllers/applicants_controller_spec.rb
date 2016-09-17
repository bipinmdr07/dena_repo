require 'rails_helper'

RSpec.describe ApplicantsController, type: :controller do
  describe "POST #create" do 
    context "attributes are valid" do      
      it "creates a new user" do
        expect {
          post :create, user: FactoryGirl.attributes_for(:user)        
        }.to change(User, :count).by(1)
      end

      context "user is an applicant for the remote program" do
        it "redirects the user to the payment page" do

        end

        it "sends a confirmation email" do

        end
      end

      context "user is an applicant for the immersive program" do
        it "redirects the user to the prework page" do

        end
      end   
        
    end

    context "attributes are invalid" do
      it "doesn't create a new user" do
        expect {
          post :create, user: FactoryGirl.attributes_for(:user, first_name: nil)        
        }.to change(User, :count).by(0)
      end
    end
  end
end
