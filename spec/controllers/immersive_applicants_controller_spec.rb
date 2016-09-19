require 'rails_helper'

RSpec.describe ImmersiveApplicantsController, type: :controller do
  describe "POST #create" do 
    context "attributes are valid" do      
      it "creates a new user" do
        expect {
          post :create, user: FactoryGirl.attributes_for(:user, package: nil)        
        }.to change(User, :count).by(1)
      end

      it "redirects the user to the next steps page" do
        post :create, user: FactoryGirl.attributes_for(:user, package: nil)        
        
        expect(response).to redirect_to apply_immersive_next_steps_path
      end

      it "sends a confirmation email" do
        expect {
          post :create, user: FactoryGirl.attributes_for(:user, package: nil)        
        }.to change { ActionMailer::Base.deliveries.count }.by(1)
      end    
        
    end

    context "attributes are invalid" do
      it "doesn't create a new user" do
        expect {
          post :create, user: FactoryGirl.attributes_for(:user, package: nil, first_name: nil)        
        }.to change(User, :count).by(0)
      end
    end    
  end
end
