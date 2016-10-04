require 'rails_helper'

RSpec.describe StudentAdmissionsController, type: :controller do
  describe "POST #create" do
    context "user is remote student" do
      it "admits user" do
        user = FactoryGirl.create(:pre_prework_student, package: :remote)

        setup_admin
        post :create, user_id: user.id
        user.reload

        expect(user.admitted).to eq(true)
        expect(user.start_date).to be_within(0.1).of(Date.today.to_datetime)
        expect(user.graduation_date).to be_within(0.1).of((Date.today + 1.month).to_datetime)
        expect(user.remaining_mentor_sessions).to eq(4)
        expect(user.ruby_access).to eq(true)
        expect(user.bootstrap_access).to eq(true)
      end
    end

    context "user is immersive student" do
      it "admits user" do
        user = FactoryGirl.create(:pre_prework_student, package: :immersive)

        setup_admin
        post :create, user_id: user.id
        user.reload

        expect(user.admitted).to eq(true)
        expect(user.start_date).to be_within(0.1).of(Date.today.to_datetime)
        expect(user.graduation_date).to be_within(0.1).of((Date.today + 2.month).to_datetime)
        expect(user.ruby_access).to eq(true)
        expect(user.bootstrap_access).to eq(true)
      end
    end
  end
end

def setup_admin
  admin = FactoryGirl.create(:admin_user)
  sign_in admin
end
