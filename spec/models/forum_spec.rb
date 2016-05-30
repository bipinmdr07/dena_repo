require 'rails_helper'

RSpec.describe Forum, type: :model do
  it { should validate_uniqueness_of :name }
end
