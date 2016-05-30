require 'rails_helper'

RSpec.describe Submission, type: :model do
  it { should validate_uniqueness_of :name }
end