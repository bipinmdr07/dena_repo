class Comment < ActiveRecord::Base
	belongs_to :forum
	belongs_to :user
	has_many :replies, dependent: :destroy

  validates :title, :description, :lesson, :user_id, :forum_id, presence: true

end
