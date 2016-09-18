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
          post :create, user: FactoryGirl.attributes_for(:user, package: :remote)        
          # expect(response).to redirect_to remote_confirmation_path
        end

        it "sends a confirmation email" do
          expect {
            post :create, user: FactoryGirl.attributes_for(:user, package: :remote)        
          }.to change { ActionMailer::Base.deliveries.count }.by(1)
        end
      end

      context "user is an applicant for the immersive program" do
        it "redirects the user to the dashboard page" do
          post :create, user: FactoryGirl.attributes_for(:user, package: :immersive)        
          
          expect(response).to redirect_to dashboard_path
        end

        it "sends a confirmation email" do
          expect {
            post :create, user: FactoryGirl.attributes_for(:user, package: :immersive)        
          }.to change { ActionMailer::Base.deliveries.count }.by(1)
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

    context "user has no package" do
      it "redirects the user to apply_path" do
        post :create, user: FactoryGirl.attributes_for(:user, package: nil)        

        expect(response).to redirect_to apply_path
      end
    end
  end
end
