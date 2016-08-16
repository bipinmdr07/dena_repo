require 'rails_helper'

RSpec.describe Feedback, type: :model do
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :title }
  it { should validate_presence_of :content }
  it { should validate_presence_of :course_name }
  it { should validate_presence_of :lesson_id }

  describe "GET #index" do
    context "User is an admin" do
      it "return true" do

      end
    end

    context "User is a student" do
      it "return false" do

      end
    end
  end

end
