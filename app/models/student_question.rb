class StudentQuestion < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  validates :title, :answer, :user_id, presence: true
end
