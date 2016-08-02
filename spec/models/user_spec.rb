require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }

  it "should save name after save" do
    user = User.create(first_name: "Cole", last_name: "Devin", name: nil)
    user.reload
    expect(user.name).to eq("Cole Devin")
  end
end
