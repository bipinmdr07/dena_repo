require 'rails_helper'

RSpec.describe Tags, type: :model do
  describe "self.get_links" do
    context "when 'ruby' is passed in as the parameter" do
      it "should return the correct link" do
        expect(
          Tags.get_links("ruby").include?(["ruby_lessons/1", "Introduction to Ruby"])
        ).to be(true)
      end
    end
  end
end
