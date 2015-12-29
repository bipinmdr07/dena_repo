class Submission < ActiveRecord::Base
	has_many :submission_comments, dependent: :destroy
end
