require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }

  describe "#update_name!" do
    it "should save name after save" do
      user = User.new(email: "test@example.com", password: "abcd123456", password_confirmation: "abcd123456", 
                      first_name: "Cole", last_name: "Devin")
      user.save
      expect(user.reload.name).to eq("Cole Devin")
    end
  end

  describe "#start_prework!" do
    it "should set prework_start_time and prework_end_time" do
      user = FactoryGirl.create(:user)
      user.start_prework!
      user.reload
      expect(user.prework_start_time).to eq Date.today
      expect(user.prework_end_date).to eq Date.today + 2.weeks
    end
  end

  describe "#has_access?" do
    it "should return true if user is admitted" do
      user = FactoryGirl.create(:user, admitted: true, prework_start_time: nil, prework_end_date: nil)
      expect(user.has_access?).to be(true)
    end

    it "should return false if user's prework_end_date is before today" do
      user = FactoryGirl.create(:user, prework_start_time: Date.today - 4.weeks, prework_end_date: Date.today - 2.weeks)
      expect(user.has_access?).to be(false)
    end

    context "when user is admitted" do
      it "should return true if user's prework_end_time is after today" do
        user = FactoryGirl.create(:user, admitted: true, prework_start_time: Date.today, prework_end_date: Date.today + 2.weeks)
        expect(user.has_access?).to be(true)
      end
    end

    context "when user is not admitted" do
      it "should return true if user's prework_end_time is after today" do
        user = FactoryGirl.create(:user, admitted: false, prework_start_time: Date.today, prework_end_date: Date.today + 2.weeks)
        expect(user.has_access?).to be(true)
      end
    end
  end
end
