class Reply < ActiveRecord::Base
	belongs_to :comment

  validates :comment_id, :user_id, :content, presence: true
end
