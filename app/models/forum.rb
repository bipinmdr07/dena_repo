class Forum < ActiveRecord::Base
	has_many :comments, dependent: :destroy

end
