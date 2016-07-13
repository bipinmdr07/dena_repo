require 'rails_helper'

RSpec.describe SubmissionComment, type: :model do
  it { should validate_presence_of :title }
  it { should validate_presence_of :description }
  it { should validate_presence_of :lesson }
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :submission_id }
end
