require 'rails_helper'

RSpec.describe CollaborationLesson, type: :model do
  describe "#self.lesson_length" do
    it "should return 9" do
      expect(CollaborationLesson.lesson_length).to eq(9)
    end
  end
end
