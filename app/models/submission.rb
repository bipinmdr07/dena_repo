class Submission < ActiveRecord::Base
	has_many :submission_comments, dependent: :destroy
  validates_uniqueness_of :name
end
