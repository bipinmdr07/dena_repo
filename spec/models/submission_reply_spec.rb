require 'rails_helper'

RSpec.describe SubmissionReply, type: :model do
  it { should validate_presence_of :submission_id }
  it { should validate_presence_of :content }
  it { should validate_presence_of :user_id }
end
