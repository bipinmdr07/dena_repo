require 'rails_helper'

RSpec.describe Submission, type: :model do
  it { should validate_presence_of :title }
  it { should validate_presence_of :content }
  it { should validate_presence_of :lesson_id }
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :course_name }
end