require 'rails_helper'

RSpec.describe PreworkKickoffsController, type: :controller do
  describe "POST #create" do
    let(:user) { FactoryGirl.create(:user) }
    before :each do
      sign_in user
    end

    context "when user has not started prework yet" do
      it "should update the user's prework statuses" do
        user.prework_start_time = nil
        user.prework_end_date = nil
        user.save
        post :create
        user.reload
        expect(user.prework_start_time).to eq(DateTime.now.beginning_of_day.to_date.to_datetime)
        expect(user.prework_end_date).to eq(DateTime.now.beginning_of_day.to_date.to_datetime + 2.weeks)
        expect(response).to redirect_to dashboard_path
      end
    end

    context "when user has started prework already" do
      it "shouldn't update the user's prework statuses" do
        user.prework_start_time = DateTime.now.beginning_of_day.to_date.to_datetime + 2.weeks
        user.prework_end_date = DateTime.now.beginning_of_day.to_date.to_datetime + 4.weeks
        post :create
        user.reload
        expect(user.prework_start_time).to eq(DateTime.now.beginning_of_day.to_date.to_datetime + 2.weeks)
        expect(user.prework_end_date).to eq(DateTime.now.beginning_of_day.to_date.to_datetime + 4.weeks)
        expect(response).to redirect_to dashboard_path
      end
    end
    
  end
end
