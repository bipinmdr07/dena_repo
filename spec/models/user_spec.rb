require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  it { should validate_presence_of :package }

  # describe "#set_admitted" do
  #   context "user is a remote student" do
  #     it "admits user" do
  #       user = FactoryGirl.create(:user, package: :remote)

  #       user.reload

  #       expect(user.admitted).to eq(true)
  #       expect(user.start_date).to eq(Date.today)
  #       expect(user.graduation_date).to eq(Date.today + 1.month)
  #       expect(user.remaining_mentor_sessions).to eq(4)
  #     end
  #   end
  # end

  describe "#has_started_prework?" do
    context "user has started prework" do
      it "returns true" do
        user = FactoryGirl.create(:prework_student)

        expect(user.has_started_prework?).to eq(true)
      end
    end

    context "user has not started prework" do
      it "returns false" do
        user = FactoryGirl.create(:pre_prework_student)

        expect(user.has_started_prework?).to eq(false)
      end
    end
  end

  describe "#send_prework_finished_message" do
    context "user is not admitted" do
      it "sends an email" do
        user_1 = FactoryGirl.create(:prework_student, prework_end_date: DateTime.now - 8.hours, admitted: false)

        expect {
          user_1.send_prework_finished_message
        }.to change { ActionMailer::Base.deliveries.count }.by(1)
      end
    end

    context "user is admitted" do
      it "does not send an email" do
        user_1 = FactoryGirl.create(:prework_student, prework_end_date: DateTime.now - 8.hours, admitted: true)

        expect {
          user_1.send_prework_finished_message
        }.to change { ActionMailer::Base.deliveries.count }.by(0)
      end
    end
  end

  describe "#self.declined_today" do
    it "returns users who were declined today" do
      user_1 = FactoryGirl.create(:prework_student, prework_end_date: DateTime.now - 8.hours, admitted: false)
      user_2 = FactoryGirl.create(:prework_student, prework_end_date: DateTime.now - 23.hours, admitted: false)
      user_3 = FactoryGirl.create(:prework_student, prework_end_date: DateTime.now - 24.hours, admitted: false)
      user_4 = FactoryGirl.create(:prework_student, prework_end_date: DateTime.now, admitted: false)
      user_5 = FactoryGirl.create(:prework_student, prework_end_date: DateTime.now + 10.minutes, admitted: false)

      expect(User.declined_today.count).to eq(3)
    end
  end

  describe "#send_prework_reminders" do
    context "user is not admitted" do
      it "sends an email" do
        user = FactoryGirl.create(:prework_student, admitted: false)

        expect {
          user.send_prework_reminders
        }.to change { ActionMailer::Base.deliveries.count }.by(1)
      end

      context "user has 4 more days left" do
        it "has title containing 4 days" do
          user = FactoryGirl.create(:prework_student, admitted: false, prework_end_date: DateTime.now + 4.days)          

          user.send_prework_reminders

          expect(ActionMailer::Base.deliveries.last.subject).to eq("3 days left until your pre-work period ends!")
          expect(ActionMailer::Base.deliveries.last.to).to eq([user.email])
        end
      end

      context "user has 1 more day left" do
        it "has title containing 1 day" do
          user = FactoryGirl.create(:prework_student, admitted: false, prework_end_date: DateTime.now + 1.day + 10.minutes)

          user.send_prework_reminders

          expect(ActionMailer::Base.deliveries.last.subject).to eq("1 day left until your pre-work period ends!")
          expect(ActionMailer::Base.deliveries.last.to).to eq([user.email])
        end
      end

      context "user has 0 more days left" do
        it "has title containing Last day" do
          user = FactoryGirl.build(:prework_student, admitted: false, prework_end_date: DateTime.now)

          user.send_prework_reminders

          expect(ActionMailer::Base.deliveries.last.subject).to eq("Last day to finish pre-work assignments!")
          expect(ActionMailer::Base.deliveries.last.to).to eq([user.email])
        end
      end
    end

    context "user is admitted" do
      it "does not send an email" do
        user = FactoryGirl.create(:prework_student, admitted: true)

        expect {
          user.send_prework_reminders
        }.to change { ActionMailer::Base.deliveries.count }.by(0)
      end
    end
  end

  describe "#update_name!" do
    it "should save name after save" do
      user = User.new(email: "test@example.com", password: "abcd123456", password_confirmation: "abcd123456",
                      first_name: "Cole", last_name: "Devin", package: :immersive)
      user.save

      expect(user.reload.name).to eq("Cole Devin")
    end
  end

  describe "#start_prework!" do
    it "should set prework_start_time and prework_end_time" do
      user = FactoryGirl.create(:user)

      user.start_prework!
      user.reload

      expect(user.prework_start_time).to be_within(0.1).of(DateTime.now)
      expect(user.prework_end_date).to be_within(0.1).of(DateTime.now + 4.days)
    end
  end

  describe "#has_access?" do
    it "should return true if user is admin" do
      user = FactoryGirl.create(:user, admin: true)
      expect(user.has_access?).to be(true)
    end

    it "should return true if user is mentor" do
      user = FactoryGirl.create(:mentor)
      expect(user.has_access?).to be(true)
    end

    it "should return true if user is admitted" do
      user = FactoryGirl.create(:user, admitted: true, prework_start_time: nil, prework_end_date: nil)

      expect(user.has_access?).to be(true)
    end

    it "should return false if user's prework_end_date is before today" do
      user = FactoryGirl.create(:prework_student, prework_start_time: Date.today - 4.weeks, prework_end_date: Date.today - 2.weeks)

      expect(user.has_access?).to be(false)
    end

    context "when user is admitted" do
      it "should return true if user's prework_end_time is after today" do
        user = FactoryGirl.create(:admitted_student)

        expect(user.has_access?).to be(true)
      end
    end

    context "when user is not admitted" do
      it "should return true if user's prework_end_time is after today" do
        user = FactoryGirl.create(:user, admitted: false, prework_start_time: Date.today, prework_end_date: Date.today + 2.weeks)
        
        expect(user.has_access?).to be(true)
      end
    end

    describe "#last_lesson" do
      it "should return the last progress lesson" do
        user = FactoryGirl.create(:user)
        progression1 = FactoryGirl.create(:progression, user_id: user.id, lesson_id: 1)
        progression2 = FactoryGirl.create(:progression, user_id: user.id, lesson_id: 2)
        progression3 = FactoryGirl.create(:progression, user_id: user.id, lesson_id: 3)

        expect(user.last_lesson).to eq(progression3)
      end
    end
  end
end
