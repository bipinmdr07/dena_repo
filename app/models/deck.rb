class Deck < ActiveRecord::Base
  belongs_to :user
  has_many :cards

  validates :title, presence: true

  scope :master, -> { where(master: true) }
end
