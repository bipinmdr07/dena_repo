require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  it { should validate_presence_of :package }

  describe "#set_admitted" do
    context "user is a remote student" do
      it "admits user" do
        user = FactoryGirl.create(:pre_prework_student, package: :remote)

        user.set_admitted!
        user.reload

        expect(user.admitted).to eq(true)
        expect(user.start_date).to be_within(0.1).of(Date.today.to_datetime)
        expect(user.graduation_date).to be_within(0.1).of((Date.today + 1.month).to_datetime)
        expect(user.remaining_mentor_sessions).to eq(4)
        expect(user.ruby_access).to eq(true)
        expect(user.bootstrap_access).to eq(true)
      end
    end

    context "user is a immersive student" do
      it "admits user" do
        user = FactoryGirl.create(:pre_prework_student, package: :immersive)

        user.set_admitted!
        user.reload

        expect(user.admitted).to eq(true)
        expect(user.start_date).to be_within(0.1).of(Date.today.to_datetime)
        expect(user.graduation_date).to be_within(0.1).of((Date.today + 2.month).to_datetime)
        expect(user.ruby_access).to eq(true)
        expect(user.bootstrap_access).to eq(true)
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
