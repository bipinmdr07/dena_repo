require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { should validate_presence_of :title }
  it { should validate_presence_of :description }
  it { should validate_presence_of :lesson }
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :forum_id }
end
