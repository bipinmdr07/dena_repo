require 'rails_helper'

RSpec.describe Reply, type: :model do
  it { should validate_presence_of :comment_id }
  it { should validate_presence_of :content }
  it { should validate_presence_of :user_id }
end
