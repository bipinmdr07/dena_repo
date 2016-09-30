require 'rails_helper'

RSpec.describe PreworkKickoffsController, type: :controller do
  describe "POST #create" do
    # let(:user) { FactoryGirl.create(:user) }
    # before :each do
    #   sign_in user
    # end


    context "when user has not started prework yet" do
      it "should update the user's prework statuses" do
        user = FactoryGirl.create(:user)
        user.prework_start_time = nil
        user.prework_end_date = nil

        sign_in user
        user.save
        post :create
        user.reload

        expect(user.prework_start_time).to be_within(0.1).of(DateTime.now.in_time_zone)
        expect(user.prework_end_date).to be_within(0.1).of(DateTime.now.in_time_zone + 4.days)
        expect(response).to redirect_to dashboard_path
      end
    end

    context "when user has started prework already" do
      it "shouldn't update the user's prework statuses" do
        user = FactoryGirl.create(:user)
        user.prework_start_time = DateTime.now.beginning_of_day.to_date.to_datetime + 2.weeks
        user.prework_end_date = DateTime.now.beginning_of_day.to_date.to_datetime + 2.weeks + 4.days

        sign_in user
        user.save
        post :create
        user.reload

        expect(user.prework_start_time).to eq(DateTime.now.beginning_of_day.to_date.to_datetime + 2.weeks)
        expect(user.prework_end_date).to eq(DateTime.now.beginning_of_day.to_date.to_datetime + 2.weeks + 4.days)
        expect(response).to redirect_to dashboard_path
      end
    end

  end
end
