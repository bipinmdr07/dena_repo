class Forum < ActiveRecord::Base
	has_many :comments, dependent: :destroy
  validates_uniqueness_of :name
  
end
